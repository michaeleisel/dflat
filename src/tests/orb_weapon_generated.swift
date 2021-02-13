// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all
// swiftformat:disable all

import FlatBuffers

public enum zzz_DflatGen_MyGame_Sample_Color: Int8, Enum {
  public typealias T = Int8
  public static var byteSize: Int { return MemoryLayout<Int8>.size }
  public var value: Int8 { return self.rawValue }
  case red = 0
  case green = 1
  case blue = 2

  public static var max: zzz_DflatGen_MyGame_Sample_Color { return .blue }
  public static var min: zzz_DflatGen_MyGame_Sample_Color { return .red }
}

public struct zzz_DflatGen_MyGame_Sample_Weapon: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsWeapon(bb: ByteBuffer) -> zzz_DflatGen_MyGame_Sample_Weapon {
    return zzz_DflatGen_MyGame_Sample_Weapon(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case name = 4
    case damage = 6
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var name: String? {
    let o = _accessor.offset(VTOFFSET.name.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var nameSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.name.v) }
  public var damage: Int16 {
    let o = _accessor.offset(VTOFFSET.damage.v)
    return o == 0 ? 0 : _accessor.readBuffer(of: Int16.self, at: o)
  }
  public static func startWeapon(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 2)
  }
  public static func add(name: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: name, at: VTOFFSET.name.p)
  }
  public static func add(damage: Int16, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: damage, def: 0, at: VTOFFSET.damage.p)
  }
  public static func endWeapon(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<UOffset> {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
  public static func createWeapon(
    _ fbb: inout FlatBufferBuilder,
    offsetOfName name: Offset<String> = Offset(),
    damage: Int16 = 0
  ) -> Offset<UOffset> {
    let __start = zzz_DflatGen_MyGame_Sample_Weapon.startWeapon(&fbb)
    zzz_DflatGen_MyGame_Sample_Weapon.add(name: name, &fbb)
    zzz_DflatGen_MyGame_Sample_Weapon.add(damage: damage, &fbb)
    return zzz_DflatGen_MyGame_Sample_Weapon.endWeapon(&fbb, start: __start)
  }
}

public struct zzz_DflatGen_MyGame_Sample_Orb: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_1_12_0() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsOrb(bb: ByteBuffer) -> zzz_DflatGen_MyGame_Sample_Orb {
    return zzz_DflatGen_MyGame_Sample_Orb(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case name = 4
    case color = 6
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var name: String? {
    let o = _accessor.offset(VTOFFSET.name.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var nameSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.name.v) }
  public var color: zzz_DflatGen_MyGame_Sample_Color {
    let o = _accessor.offset(VTOFFSET.color.v)
    return o == 0
      ? .red
      : zzz_DflatGen_MyGame_Sample_Color(rawValue: _accessor.readBuffer(of: Int8.self, at: o))
        ?? .red
  }
  public static func startOrb(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 2) }
  public static func add(name: Offset<String>, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: name, at: VTOFFSET.name.p)
  }
  public static func add(color: zzz_DflatGen_MyGame_Sample_Color, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: color.rawValue, def: 0, at: VTOFFSET.color.p)
  }
  public static func endOrb(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<UOffset> {
    let end = Offset<UOffset>(offset: fbb.endTable(at: start))
    return end
  }
  public static func createOrb(
    _ fbb: inout FlatBufferBuilder,
    offsetOfName name: Offset<String> = Offset(),
    color: zzz_DflatGen_MyGame_Sample_Color = .red
  ) -> Offset<UOffset> {
    let __start = zzz_DflatGen_MyGame_Sample_Orb.startOrb(&fbb)
    zzz_DflatGen_MyGame_Sample_Orb.add(name: name, &fbb)
    zzz_DflatGen_MyGame_Sample_Orb.add(color: color, &fbb)
    return zzz_DflatGen_MyGame_Sample_Orb.endOrb(&fbb, start: __start)
  }
}
