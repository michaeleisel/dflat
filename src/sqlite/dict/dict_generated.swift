// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all
// swiftformat:disable all

import FlatBuffers

public enum zzz_DflatGen_ValueType: Int8, Enum, Verifiable {
  public typealias T = Int8
  public static var byteSize: Int { return MemoryLayout<Int8>.size }
  public var value: Int8 { return self.rawValue }
  case boolvalue = 0
  case longvalue = 1
  case unsignedlongvalue = 2
  case floatvalue = 3
  case doublevalue = 4
  case stringvalue = 5
  case codablevalue = 6
  case flatbuffersvalue = 7

  public static var max: zzz_DflatGen_ValueType { return .flatbuffersvalue }
  public static var min: zzz_DflatGen_ValueType { return .boolvalue }
}

public struct zzz_DflatGen_DictItem: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsDictItem(bb: ByteBuffer) -> zzz_DflatGen_DictItem {
    return zzz_DflatGen_DictItem(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case key = 4
    case namespace = 6
    case version = 8
    case valueType = 10
    case boolValue = 12
    case longValue = 14
    case unsignedLongValue = 16
    case floatValue = 18
    case doubleValue = 20
    case stringValue = 22
    case codable = 24
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var key: String? {
    let o = _accessor.offset(VTOFFSET.key.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var keySegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.key.v) }
  public var namespace: String? {
    let o = _accessor.offset(VTOFFSET.namespace.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var namespaceSegmentArray: [UInt8]? {
    return _accessor.getVector(at: VTOFFSET.namespace.v)
  }
  public var version: String? {
    let o = _accessor.offset(VTOFFSET.version.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var versionSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.version.v) }
  public var valueType: zzz_DflatGen_ValueType {
    let o = _accessor.offset(VTOFFSET.valueType.v)
    return o == 0
      ? .boolvalue
      : zzz_DflatGen_ValueType(rawValue: _accessor.readBuffer(of: Int8.self, at: o)) ?? .boolvalue
  }
  public var boolValue: Bool {
    let o = _accessor.offset(VTOFFSET.boolValue.v)
    return o == 0 ? false : 0 != _accessor.readBuffer(of: Byte.self, at: o)
  }
  public var longValue: Int64 {
    let o = _accessor.offset(VTOFFSET.longValue.v)
    return o == 0 ? 0 : _accessor.readBuffer(of: Int64.self, at: o)
  }
  public var unsignedLongValue: UInt64 {
    let o = _accessor.offset(VTOFFSET.unsignedLongValue.v)
    return o == 0 ? 0 : _accessor.readBuffer(of: UInt64.self, at: o)
  }
  public var floatValue: Float32 {
    let o = _accessor.offset(VTOFFSET.floatValue.v)
    return o == 0 ? 0.0 : _accessor.readBuffer(of: Float32.self, at: o)
  }
  public var doubleValue: Double {
    let o = _accessor.offset(VTOFFSET.doubleValue.v)
    return o == 0 ? 0.0 : _accessor.readBuffer(of: Double.self, at: o)
  }
  public var stringValue: String? {
    let o = _accessor.offset(VTOFFSET.stringValue.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var stringValueSegmentArray: [UInt8]? {
    return _accessor.getVector(at: VTOFFSET.stringValue.v)
  }
  public var hasCodable: Bool {
    let o = _accessor.offset(VTOFFSET.codable.v)
    return o == 0 ? false : true
  }
  public var codableCount: Int32 {
    let o = _accessor.offset(VTOFFSET.codable.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func codable(at index: Int32) -> UInt8 {
    let o = _accessor.offset(VTOFFSET.codable.v)
    return o == 0
      ? 0 : _accessor.directRead(of: UInt8.self, offset: _accessor.vector(at: o) + index * 1)
  }
  public var codable: [UInt8] { return _accessor.getVector(at: VTOFFSET.codable.v) ?? [] }
  public static func startDictItem(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 11)
  }
  public static func add(key: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: key, at: VTOFFSET.key.p)
  }
  public static func add(namespace: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: namespace, at: VTOFFSET.namespace.p)
  }
  public static func add(version: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: version, at: VTOFFSET.version.p)
  }
  public static func add(valueType: zzz_DflatGen_ValueType, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: valueType.rawValue, def: 0, at: VTOFFSET.valueType.p)
  }
  public static func add(boolValue: Bool, _ fbb: inout FlatBufferBuilder) {
    fbb.add(
      element: boolValue, def: false,
      at: VTOFFSET.boolValue.p)
  }
  public static func add(longValue: Int64, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: longValue, def: 0, at: VTOFFSET.longValue.p)
  }
  public static func add(unsignedLongValue: UInt64, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: unsignedLongValue, def: 0, at: VTOFFSET.unsignedLongValue.p)
  }
  public static func add(floatValue: Float32, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: floatValue, def: 0.0, at: VTOFFSET.floatValue.p)
  }
  public static func add(doubleValue: Double, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: doubleValue, def: 0.0, at: VTOFFSET.doubleValue.p)
  }
  public static func add(stringValue: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: stringValue, at: VTOFFSET.stringValue.p)
  }
  public static func addVectorOf(codable: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: codable, at: VTOFFSET.codable.p)
  }
  public static func endDictItem(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset {
    let end = Offset(offset: fbb.endTable(at: start))
    return end
  }
  public static func createDictItem(
    _ fbb: inout FlatBufferBuilder,
    keyOffset key: Offset = Offset(),
    namespaceOffset namespace: Offset = Offset(),
    versionOffset version: Offset = Offset(),
    valueType: zzz_DflatGen_ValueType = .boolvalue,
    boolValue: Bool = false,
    longValue: Int64 = 0,
    unsignedLongValue: UInt64 = 0,
    floatValue: Float32 = 0.0,
    doubleValue: Double = 0.0,
    stringValueOffset stringValue: Offset = Offset(),
    codableVectorOffset codable: Offset = Offset()
  ) -> Offset {
    let __start = zzz_DflatGen_DictItem.startDictItem(&fbb)
    zzz_DflatGen_DictItem.add(key: key, &fbb)
    zzz_DflatGen_DictItem.add(namespace: namespace, &fbb)
    zzz_DflatGen_DictItem.add(version: version, &fbb)
    zzz_DflatGen_DictItem.add(valueType: valueType, &fbb)
    zzz_DflatGen_DictItem.add(boolValue: boolValue, &fbb)
    zzz_DflatGen_DictItem.add(longValue: longValue, &fbb)
    zzz_DflatGen_DictItem.add(unsignedLongValue: unsignedLongValue, &fbb)
    zzz_DflatGen_DictItem.add(floatValue: floatValue, &fbb)
    zzz_DflatGen_DictItem.add(doubleValue: doubleValue, &fbb)
    zzz_DflatGen_DictItem.add(stringValue: stringValue, &fbb)
    zzz_DflatGen_DictItem.addVectorOf(codable: codable, &fbb)
    return zzz_DflatGen_DictItem.endDictItem(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(
      field: VTOFFSET.key.p, fieldName: "key", required: false, type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.namespace.p, fieldName: "namespace", required: false,
      type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.version.p, fieldName: "version", required: false,
      type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.valueType.p, fieldName: "valueType", required: false,
      type: zzz_DflatGen_ValueType.self)
    try _v.visit(
      field: VTOFFSET.boolValue.p, fieldName: "boolValue", required: false, type: Bool.self)
    try _v.visit(
      field: VTOFFSET.longValue.p, fieldName: "longValue", required: false, type: Int64.self)
    try _v.visit(
      field: VTOFFSET.unsignedLongValue.p, fieldName: "unsignedLongValue", required: false,
      type: UInt64.self)
    try _v.visit(
      field: VTOFFSET.floatValue.p, fieldName: "floatValue", required: false, type: Float32.self)
    try _v.visit(
      field: VTOFFSET.doubleValue.p, fieldName: "doubleValue", required: false, type: Double.self)
    try _v.visit(
      field: VTOFFSET.stringValue.p, fieldName: "stringValue", required: false,
      type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.codable.p, fieldName: "codable", required: false,
      type: ForwardOffset<Vector<UInt8, UInt8>>.self)
    _v.finish()
  }
}
