// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all

import FlatBuffers

public struct zzz_DflatGen_BenchDocV4: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsBenchDocV4(bb: ByteBuffer) -> zzz_DflatGen_BenchDocV4 {
    return zzz_DflatGen_BenchDocV4(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case title = 4
    case tag = 6
    case priority = 8
    case text = 10
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var title: String? {
    let o = _accessor.offset(VTOFFSET.title.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var titleSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.title.v) }
  public var tag: String? {
    let o = _accessor.offset(VTOFFSET.tag.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var tagSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.tag.v) }
  public var priority: Int32 {
    let o = _accessor.offset(VTOFFSET.priority.v)
    return o == 0 ? 0 : _accessor.readBuffer(of: Int32.self, at: o)
  }
  public var text: String? {
    let o = _accessor.offset(VTOFFSET.text.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var textSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.text.v) }
  public static func startBenchDocV4(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 4)
  }
  public static func add(title: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: title, at: VTOFFSET.title.p)
  }
  public static func add(tag: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: tag, at: VTOFFSET.tag.p)
  }
  public static func add(priority: Int32, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: priority, def: 0, at: VTOFFSET.priority.p)
  }
  public static func add(text: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: text, at: VTOFFSET.text.p)
  }
  public static func endBenchDocV4(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<
    UOffset
  > {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
  public static func createBenchDocV4(
    _ fbb: inout FlatBufferBuilder,
    offsetOfTitle title: Offset<String> = Offset(),
    offsetOfTag tag: Offset<String> = Offset(),
    priority: Int32 = 0,
    offsetOfText text: Offset<String> = Offset()
  ) -> Offset<UOffset> {
    let __start = zzz_DflatGen_BenchDocV4.startBenchDocV4(&fbb)
    zzz_DflatGen_BenchDocV4.add(title: title, &fbb)
    zzz_DflatGen_BenchDocV4.add(tag: tag, &fbb)
    zzz_DflatGen_BenchDocV4.add(priority: priority, &fbb)
    zzz_DflatGen_BenchDocV4.add(text: text, &fbb)
    return zzz_DflatGen_BenchDocV4.endBenchDocV4(&fbb, start: __start)
  }
}
