// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all

import FlatBuffers

public enum zzz_DflatGen_Color: Int8, Enum {
  public typealias T = Int8
  public static var byteSize: Int { return MemoryLayout<Int8>.size }
  public var value: Int8 { return self.rawValue }
  case red = 0
  case green = 1
  case blue = 2

  public static var max: zzz_DflatGen_Color { return .blue }
  public static var min: zzz_DflatGen_Color { return .red }
}

public enum zzz_DflatGen_Content: UInt8, Enum {
  public typealias T = UInt8
  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case none_ = 0
  case textcontent = 1
  case imagecontent = 2

  public static var max: zzz_DflatGen_Content { return .imagecontent }
  public static var min: zzz_DflatGen_Content { return .none_ }
}

public struct zzz_DflatGen_Vec3: Readable {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Struct

  public static var size = 12
  public static var alignment = 4
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Struct(bb: bb, position: o) }

  public var x: Float32 { return _accessor.readBuffer(of: Float32.self, at: 0) }
  public var y: Float32 { return _accessor.readBuffer(of: Float32.self, at: 4) }
  public var z: Float32 { return _accessor.readBuffer(of: Float32.self, at: 8) }
}

extension zzz_DflatGen_Vec3 {
  @discardableResult
  public static func createVec3(
    builder: inout FlatBufferBuilder, x: Float32 = 0.0, y: Float32 = 0.0, z: Float32 = 0.0
  ) -> Offset<UOffset> {
    builder.createStructOf(size: zzz_DflatGen_Vec3.size, alignment: zzz_DflatGen_Vec3.alignment)
    builder.reverseAdd(v: x, postion: 0)
    builder.reverseAdd(v: y, postion: 4)
    builder.reverseAdd(v: z, postion: 8)
    return builder.endStruct()
  }

}

public struct zzz_DflatGen_TextContent: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsTextContent(bb: ByteBuffer) -> zzz_DflatGen_TextContent {
    return zzz_DflatGen_TextContent(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case text = 4
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var text: String? {
    let o = _accessor.offset(VTOFFSET.text.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var textSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.text.v) }
  public static func startTextContent(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 1)
  }
  public static func add(text: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: text, at: VTOFFSET.text.p)
  }
  public static func endTextContent(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<
    UOffset
  > {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
  public static func createTextContent(
    _ fbb: inout FlatBufferBuilder,
    offsetOfText text: Offset<String> = Offset()
  ) -> Offset<UOffset> {
    let __start = zzz_DflatGen_TextContent.startTextContent(&fbb)
    zzz_DflatGen_TextContent.add(text: text, &fbb)
    return zzz_DflatGen_TextContent.endTextContent(&fbb, start: __start)
  }
}

public struct zzz_DflatGen_ImageContent: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsImageContent(bb: ByteBuffer) -> zzz_DflatGen_ImageContent {
    return zzz_DflatGen_ImageContent(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case images = 4
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var imagesCount: Int32 {
    let o = _accessor.offset(VTOFFSET.images.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func images(at index: Int32) -> String? {
    let o = _accessor.offset(VTOFFSET.images.v)
    return o == 0 ? nil : _accessor.directString(at: _accessor.vector(at: o) + index * 4)
  }
  public static func startImageContent(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 1)
  }
  public static func addVectorOf(images: Offset<UOffset>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: images, at: VTOFFSET.images.p)
  }
  public static func endImageContent(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<
    UOffset
  > {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
  public static func createImageContent(
    _ fbb: inout FlatBufferBuilder,
    vectorOfImages images: Offset<UOffset> = Offset()
  ) -> Offset<UOffset> {
    let __start = zzz_DflatGen_ImageContent.startImageContent(&fbb)
    zzz_DflatGen_ImageContent.addVectorOf(images: images, &fbb)
    return zzz_DflatGen_ImageContent.endImageContent(&fbb, start: __start)
  }
}

public struct zzz_DflatGen_BenchDoc: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsBenchDoc(bb: ByteBuffer) -> zzz_DflatGen_BenchDoc {
    return zzz_DflatGen_BenchDoc(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case pos = 4
    case color = 6
    case title = 8
    case contentType = 10
    case content = 12
    case tag = 14
    case priority = 16
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var pos: zzz_DflatGen_Vec3? {
    let o = _accessor.offset(VTOFFSET.pos.v)
    return o == 0 ? nil : zzz_DflatGen_Vec3(_accessor.bb, o: o + _accessor.postion)
  }
  public var color: zzz_DflatGen_Color {
    let o = _accessor.offset(VTOFFSET.color.v)
    return o == 0
      ? .red : zzz_DflatGen_Color(rawValue: _accessor.readBuffer(of: Int8.self, at: o)) ?? .red
  }
  public var title: String? {
    let o = _accessor.offset(VTOFFSET.title.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var titleSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.title.v) }
  public var contentType: zzz_DflatGen_Content {
    let o = _accessor.offset(VTOFFSET.contentType.v)
    return o == 0
      ? .none_
      : zzz_DflatGen_Content(rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .none_
  }
  public func content<T: FlatBufferObject>(type: T.Type) -> T? {
    let o = _accessor.offset(VTOFFSET.content.v)
    return o == 0 ? nil : _accessor.union(o)
  }
  public var tag: String? {
    let o = _accessor.offset(VTOFFSET.tag.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var tagSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.tag.v) }
  public var priority: Int32 {
    let o = _accessor.offset(VTOFFSET.priority.v)
    return o == 0 ? 0 : _accessor.readBuffer(of: Int32.self, at: o)
  }
  public static func startBenchDoc(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 7)
  }
  public static func add(pos: Offset<UOffset>?, _ fbb: inout FlatBufferBuilder) {
    guard pos != nil else { return }
    fbb.add(structOffset: VTOFFSET.pos.p)
  }
  public static func add(color: zzz_DflatGen_Color, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: color.rawValue, def: 0, at: VTOFFSET.color.p)
  }
  public static func add(title: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: title, at: VTOFFSET.title.p)
  }
  public static func add(contentType: zzz_DflatGen_Content, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: contentType.rawValue, def: 0, at: VTOFFSET.contentType.p)
  }
  public static func add(content: Offset<UOffset>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: content, at: VTOFFSET.content.p)
  }
  public static func add(tag: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: tag, at: VTOFFSET.tag.p)
  }
  public static func add(priority: Int32, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: priority, def: 0, at: VTOFFSET.priority.p)
  }
  public static func endBenchDoc(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<UOffset>
  {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
}
