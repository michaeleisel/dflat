import FlatBuffers

public struct NotInExpr<T: Expr, Element>: Expr where T.ResultType: Hashable, T.ResultType: DflatFriendlyValue, T.Element == Element {
  public typealias ResultType = Bool
  public typealias Element = Element
  public let unary: T
  public let set: Set<T.ResultType>
  public func evaluate(object: Evaluable<Element>) -> (result: ResultType, unknown: Bool) {
    let val = unary.evaluate(object: object)
    guard (!val.unknown) else { return (false, true) }
    return (!set.contains(val.result), false)
  }
  public func canUsePartialIndex(_ indexSurvey: IndexSurvey) -> IndexUsefulness {
    unary.canUsePartialIndex(indexSurvey) == .full ? .full : .none
  }
  public func existingIndex(_ existingIndexes: inout Set<String>) {
    unary.existingIndex(&existingIndexes)
  }
}

public extension Expr {
  func notIn<S>(_ sequence: S) -> NotInExpr<Self, Self.Element> where S: Sequence, S.Element == Self.ResultType {
    NotInExpr(unary: self, set: Set(sequence))
  }
}
