// MARK - Queries

public protocol Queryable {
  /**
   * Return a QueryBuilder that you can make `where` or `all` queries against.
   */
  func fetch<Element: Atom>(for ofType: Element.Type) -> QueryBuilder<Element>
  /**
   * Provide a consistent view for fetching multiple objects at once.
   */
  func fetchWithinASnapshot<T>(_: () -> T) -> T
}

public protocol WorkspaceSubscription {
  /**
   * Cancel an existing subscription. It is guaranteed that no callback will happen
   * immediately after `cancel`.
   */
  func cancel()
}

public enum SubscribedObject<Element: Atom> {
  /**
   * Giving the updated object.
   */
  case updated(_: Element)
  /**
   * The object is deleted. This denotes the end of a subscription.
   */
  case deleted
}

public enum SubscribedDictionaryValue<Element: Equatable>: Equatable {
  /**
   * Giving the initial value upon subscription (nil means no value).
   */
  case initial(_: Element?)
  /**
   * Giving the updated value.
   */
  case updated(_: Element)
  /**
   * The value is deleted.
   */
  case deleted
}

public protocol WorkspaceDictionary {
  /**
   * Get the latest value, whether it is in memory or from disk.
   * Set the value, it will persist asynchronously.
   *
   * - Parameters:
   *    - key: Key to index into the persisted dictionary.
   *
   * - Returns: Value associated with the provided key. Nil if doesn't exist.
   */
  subscript<T: Codable & Equatable>(_: String, _: T.Type) -> T? { get set }
  subscript<T: Codable & FlatBuffersCodable & Equatable>(_: String, _: T.Type) -> T? { get set }
  subscript(_: String, _: Bool.Type) -> Bool? { get set }
  subscript(_: String, _: Int.Type) -> Int? { get set }
  subscript(_: String, _: UInt.Type) -> UInt? { get set }
  subscript(_: String, _: Float.Type) -> Float? { get set }
  subscript(_: String, _: Double.Type) -> Double? { get set }
  subscript(_: String, _: String.Type) -> String? { get set }
  /**
   * Force current thread to wait until everything has been written to disk.
   * Note that this function forces wait to disk, but not synchronize across
   * threads. You could have one thread called synchronize while another thread
   * is still holding their own lock to update in-memory value. It doesn't guarantee
   * the first thread will wait the second thread's dictionary[key] = value to finish.
   * This method only guarantees all writes on current thread done.
   */
  func synchronize()
  /**
   * Return all keys available in the dictionary. This is an expensive (for this dictionary)
   * method as it fetches from disk, from in-memory structures, and acquire locks if needed.
   *
   * - Returns: List of all keys available at the point of time in persisted dictionary.
   */
  var keys: [String] { get }
  /**
   * Remove all key-value pairs in the dictionary. Like `keys`, this is an expensive method
   * in the sense that it needs to acquire locks for all in-memory structures. But it is not
   * as expensive as `keys` because the deletion from disk is asynchronous (no need to wait
   * fetching from disk).
   */
  mutating func removeAll()
  /**
   * Subscribe to changes of a given key. If a new value added, changed, or removed, a
   * callback will be triggered. The callback will be triggered on the target queue the same
   * as the workspace. It will also trigger a callback upon first subscription to give you
   * something to start with.
   *
   * - Parameters:
   *    - object: The object to be observed. If it is outdated already, you will get an updated callback
   *              soon after.
   *    - changeHandler: The callback where you will receive an update if anything changed.
   *
   * - Returns: A subscription object that you can cancel on. If no one hold the subscription, it will cancel
   *            automatically.
   */
  func subscribe<Element: Codable & Equatable>(
    _: String,
    of: Element.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Element>) -> Void
  ) -> Workspace.Subscription
  func subscribe<Element: FlatBuffersCodable & Equatable>(
    _: String,
    of: Element.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Element>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: Bool.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Bool>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: Int.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Int>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: UInt.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<UInt>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: Float.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Float>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: Double.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<Double>) -> Void
  ) -> Workspace.Subscription
  func subscribe(
    _: String,
    of: String.Type, changeHandler: @escaping (_: SubscribedDictionaryValue<String>) -> Void
  ) -> Workspace.Subscription
  #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    // MARK - Combine-compliant
    /**
     * Return a publisher for key subscription in Combine.
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<Element: Codable & Equatable>(_: String, of: Element.Type)
      -> DictionaryValuePublisher<Element>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<Element: FlatBuffersCodable & Equatable>(_: String, of: Element.Type)
      -> DictionaryValuePublisher<Element>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: Bool.Type) -> DictionaryValuePublisher<Bool>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: Int.Type) -> DictionaryValuePublisher<Int>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: UInt.Type) -> DictionaryValuePublisher<UInt>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: Float.Type) -> DictionaryValuePublisher<Float>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: Double.Type) -> DictionaryValuePublisher<Double>
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher(_: String, of: String.Type) -> DictionaryValuePublisher<String>
  #endif
  #if compiler(>=5.5) && canImport(_Concurrency)
    /**
     * Subscribe to a given key, and return the AsyncSequence you can iterate over.
     *
     * - Parameters:
     *    - key: The key for the dictionary.
     *    - bufferingPolicy: The buffering policy to avoid issuing all updates to concerned parties. Default will be the newest of 1.
     *
     * - Returns: An AsyncSequence that can await for new updates. It never finishes.
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe<Element: Codable & Equatable>(
      _: String, of: Element.Type,
      bufferingPolicy: AsyncStream<Element?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Element?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe<Element: FlatBuffersCodable & Equatable>(
      _: String, of: Element.Type,
      bufferingPolicy: AsyncStream<Element?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Element?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: Bool.Type, bufferingPolicy: AsyncStream<Bool?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Bool?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: Int.Type, bufferingPolicy: AsyncStream<Int?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Int?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: UInt.Type, bufferingPolicy: AsyncStream<UInt?>.Continuation.BufferingPolicy
    ) -> AsyncStream<UInt?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: Float.Type, bufferingPolicy: AsyncStream<Float?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Float?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: Double.Type, bufferingPolicy: AsyncStream<Double?>.Continuation.BufferingPolicy
    ) -> AsyncStream<Double?>
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe(
      _: String, of: String.Type, bufferingPolicy: AsyncStream<String?>.Continuation.BufferingPolicy
    ) -> AsyncStream<String?>
  #endif
}

public struct WorkspaceShutdownFlag: OptionSet {
  public let rawValue: Int
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
  public static let truncate = WorkspaceShutdownFlag(rawValue: 1 << 0)
  public static let vacuum = WorkspaceShutdownFlag(rawValue: 2 << 0)
}

public protocol Workspace: Queryable {
  // MARK - Management
  typealias ShutdownFlag = WorkspaceShutdownFlag
  /**
   * Shutdown the Workspace. All transactions made to Dflat after this call will fail.
   * Transactions initiated before this will finish normally. Data fetching after this
   * will return empty results. Any data fetching triggered before this call will finish
   * normally, hence the `completion` part. The `completion` closure, if supplied, will
   * be called once all transactions and data fetching initiated before shutdown finish.
   * If `completion` closure not provided, this call will wait until all finished before
   * return.
   */
  func shutdown(flags: ShutdownFlag, completion: (() -> Void)?)
  // MARK - Changes
  typealias ChangesHandler = (_ transactionContext: TransactionContext) -> Void
  typealias CompletionHandler = (_ success: Bool) -> Void
  /**
   * Perform a transaction for given object types.
   *
   * - Parameters:
   *    - transactionalObjectTypes: A list of object types you are going to transact with. If you
   *                                If you fetch or mutation an object outside of this list, it will fatal.
   *    - changesHandler: The transaction closure where you will give a transactionContext and safe to do
   *                      data mutations through submission of change requests.
   *    - completionHandler: If supplied, will be called once the transaction committed. It will be called
   *                         with success / failure. You don't need to handle failure cases specifically
   *                         (such as retry), but rather to surface and log such error.
   */
  func performChanges(
    _ transactionalObjectTypes: [Any.Type], changesHandler: @escaping ChangesHandler,
    completionHandler: CompletionHandler?)
  /**
   * A persisted, in-memory cached key-value storage backed by current Workspace.
   * While writing data to disk is serialized under the hood, we don't wait the
   * writes. This dictionary is an class object, it is always mutable.
   */
  var dictionary: WorkspaceDictionary { get set }
  // MARK - Observations
  typealias Subscription = WorkspaceSubscription
  /**
   * Subscribe to changes of a fetched result. You queries fetched result with
   * `fetch(for:).where()` method and the result can be observed. If any object
   * created / updated meet the query criterion, the callback will happen and you
   * will get a updated fetched result.
   *
   * - Parameters:
   *    - fetchedResult: The original fetchedResult. If it is outdated already, you will get an updated
   *                     callback soon after.
   *    - changeHandler: The callback where you will receive an update if anything changed.
   *
   * - Returns: A subscription object that you can cancel the subscription. If no one hold the subscription
   *            object, it will cancel automatically.
   */
  func subscribe<Element: Atom & Equatable>(
    fetchedResult: FetchedResult<Element>,
    changeHandler: @escaping (_: FetchedResult<Element>) -> Void
  ) -> Subscription
  /**
   * Subscribe to changes of an object. If anything in the object changed or
   * the object itself is deleted. Deletion is a terminal event for subscription.
   * Even if later you inserted an object with the same primary key, the subscription
   * callback won't be triggered. This is different from fetched result subscription
   * above where if you query by primary key, you will get subscription update if
   * a new object with the same primary key later created.
   *
   * - Parameters:
   *    - object: The object to be observed. If it is outdated already, you will get an updated callback
   *              soon after.
   *    - changeHandler: The callback where you will receive an update if anything changed.
   *
   * - Returns: A subscription object that you can cancel on. If no one hold the subscription, it will cancel
   *            automatically.
   */
  func subscribe<Element: Atom & Equatable>(
    object: Element, changeHandler: @escaping (_: SubscribedObject<Element>) -> Void
  ) -> Subscription
  #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    // MARK - Combine-compliant
    /**
     * Return a publisher for object subscription in Combine.
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<Element: Atom & Equatable>(for: Element) -> AtomPublisher<Element>
    /**
     * Return a publisher for fetched result subscription in Combine.
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<Element: Atom & Equatable>(for: FetchedResult<Element>)
      -> FetchedResultPublisher<Element>
    /**
     * Return a publisher builder for query subscription in Combine.
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func publisher<Element: Atom & Equatable>(for: Element.Type) -> QueryPublisherBuilder<Element>
  #endif
  #if compiler(>=5.5) && canImport(_Concurrency)
    /**
     * Subscribe to changes to the said object, and return the AsyncSequence you can iterate over.
     *
     * - Parameters:
     *    - object: The object previously fetched that we want to observe the new updates.
     *    - bufferingPolicy: The buffering policy to avoid issuing all updates to concerned parties. Default will be the newest of 1.
     *
     * - Returns: An AsyncSequence that can await for new object updates. Finishes only if the object deletes.
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe<Element: Atom & Equatable>(
      object: Element, bufferingPolicy: AsyncStream<Element>.Continuation.BufferingPolicy
    ) -> AsyncStream<Element>
    /**
     * Subscribe to changes to the said fetched result, and return the AsyncSequence you can iterate over.
     *
     * - Parameters:
     *    - fetchedResult: The result fetched that we want to observe the new updates.
     *    - bufferingPolicy: The buffering policy to avoid issuing all updates to concerned parties. Default will be the newest of 1.
     *
     * - Returns: An AsyncSequence that can await for new fetched result. It never finishes.
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func subscribe<Element: Atom & Equatable>(
      fetchedResult: FetchedResult<Element>,
      bufferingPolicy: AsyncStream<FetchedResult<Element>>.Continuation.BufferingPolicy
    ) -> AsyncStream<FetchedResult<Element>>
  #endif
}

extension WorkspaceDictionary {
  /**
   * Get the value without type specifier.
   */
  public subscript<T: Codable & Equatable>(key: String) -> T? {
    get { self[key, T.self] }
    set { self[key, T.self] = newValue }
  }
  public subscript<T: Codable & FlatBuffersCodable & Equatable>(key: String) -> T? {
    get { self[key, T.self] }
    set { self[key, T.self] = newValue }
  }
  public subscript(key: String) -> Bool? {
    get { self[key, Bool.self] }
    set { self[key, Bool.self] = newValue }
  }
  public subscript(key: String) -> Int? {
    get { self[key, Int.self] }
    set { self[key, Int.self] = newValue }
  }
  public subscript(key: String) -> UInt? {
    get { self[key, UInt.self] }
    set { self[key, UInt.self] = newValue }
  }
  public subscript(key: String) -> Float? {
    get { self[key, Float.self] }
    set { self[key, Float.self] = newValue }
  }
  public subscript(key: String) -> Double? {
    get { self[key, Double.self] }
    set { self[key, Double.self] = newValue }
  }
  public subscript(key: String) -> String? {
    get { self[key, String.self] }
    set { self[key, String.self] = newValue }
  }
}

extension WorkspaceDictionary {
  /**
   * Get the latest value, whether it is in memory or from disk.
   * If the value is not available, use the default one. It won't
   * persist the default value into memory or disk. Thus, if you
   * call this method again with different default value (while
   * the underlying kept nil), it will return that different default
   * value.
   *
   * - Parameters:
   *    - key: Key to index into the persisted dictionary.
   *    - default: The default value to use if the key is missing.
   *
   * - Returns: Value associated with the provided key. Return the default value if missing.
   */
  public subscript<T: Codable & Equatable>(key: String, default value: T) -> T {
    get { self[key] ?? value }
  }
  public subscript<T: Codable & FlatBuffersCodable & Equatable>(key: String, default value: T) -> T {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: Bool) -> Bool {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: Int) -> Int {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: UInt) -> UInt {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: Float) -> Float {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: Double) -> Double {
    get { self[key] ?? value }
  }
  public subscript(key: String, default value: String) -> String {
    get { self[key] ?? value }
  }
}

extension Workspace {
  public func shutdown(flags: ShutdownFlag) {
    shutdown(flags: flags, completion: nil)
  }
  public func shutdown() {
    shutdown(flags: [], completion: nil)
  }
  public func shutdown(completion: (() -> Void)?) {
    shutdown(flags: [], completion: completion)
  }
  public func performChanges(
    _ transactionalObjectTypes: [Any.Type], changesHandler: @escaping ChangesHandler
  ) {
    performChanges(transactionalObjectTypes, changesHandler: changesHandler, completionHandler: nil)
  }
  #if compiler(>=5.5) && canImport(_Concurrency)
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func shutdown() async {
      await withUnsafeContinuation { continuation in
        shutdown {
          continuation.resume()
        }
      }
    }
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func shutdown(flags: ShutdownFlag) async {
      await withUnsafeContinuation { continuation in
        shutdown(flags: flags) {
          continuation.resume()
        }
      }
    }
    /**
     * Perform a transaction for given object types and await either success or failure boolean.
     *
     * - Parameters:
     *    - transactionalObjectTypes: A list of object types you are going to transact with. If you
     *                                If you fetch or mutation an object outside of this list, it will fatal.
     *    - changesHandler: The transaction closure where you will give a transactionContext and safe to do
     *                      data mutations through submission of change requests.
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @discardableResult
    public func performChanges(
      _ transactionalObjectTypes: [Any.Type], changesHandler: @escaping ChangesHandler
    ) async -> Bool {
      return await withUnsafeContinuation { continuation in
        performChanges(transactionalObjectTypes, changesHandler: changesHandler) {
          continuation.resume(returning: $0)
        }
      }
    }
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func subscribe<Element: Atom & Equatable>(object: Element) -> AsyncStream<Element> {
      subscribe(object: object, bufferingPolicy: .bufferingNewest(1))
    }
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    public func subscribe<Element: Atom & Equatable>(fetchedResult: FetchedResult<Element>)
      -> AsyncStream<FetchedResult<Element>>
    {
      subscribe(fetchedResult: fetchedResult, bufferingPolicy: .bufferingNewest(1))
    }
  #endif
}
