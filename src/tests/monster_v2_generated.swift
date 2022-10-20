// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all
// swiftformat:disable all

import FlatBuffers

public enum zzz_DflatGen_MyGame_SampleV2_Color: Int8, Enum, Verifiable {
  public typealias T = Int8
  public static var byteSize: Int { return MemoryLayout<Int8>.size }
  public var value: Int8 { return self.rawValue }
  case red = 0
  case green = 1
  case blue = 2

  public static var max: zzz_DflatGen_MyGame_SampleV2_Color { return .blue }
  public static var min: zzz_DflatGen_MyGame_SampleV2_Color { return .red }
}

public enum zzz_DflatGen_MyGame_SampleV2_Equipment: UInt8, UnionEnum {
  public typealias T = UInt8

  public init?(value: T) {
    self.init(rawValue: value)
  }

  public static var byteSize: Int { return MemoryLayout<UInt8>.size }
  public var value: UInt8 { return self.rawValue }
  case none_ = 0
  case weapon = 1
  case orb = 2
  case empty = 3

  public static var max: zzz_DflatGen_MyGame_SampleV2_Equipment { return .empty }
  public static var min: zzz_DflatGen_MyGame_SampleV2_Equipment { return .none_ }
}

public struct zzz_DflatGen_MyGame_SampleV2_Vec3: NativeStruct, Verifiable, FlatbuffersInitializable
{

  static func validateVersion() { FlatBuffersVersion_22_9_29() }

  private var _x: Float32
  private var _y: Float32
  private var _z: Float32

  public init(_ bb: ByteBuffer, o: Int32) {
    let _accessor = Struct(bb: bb, position: o)
    _x = _accessor.readBuffer(of: Float32.self, at: 0)
    _y = _accessor.readBuffer(of: Float32.self, at: 4)
    _z = _accessor.readBuffer(of: Float32.self, at: 8)
  }

  public init(x: Float32, y: Float32, z: Float32) {
    _x = x
    _y = y
    _z = z
  }

  public init() {
    _x = 0.0
    _y = 0.0
    _z = 0.0
  }

  public var x: Float32 { _x }
  public var y: Float32 { _y }
  public var z: Float32 { _z }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    try verifier.inBuffer(position: position, of: zzz_DflatGen_MyGame_SampleV2_Vec3.self)
  }
}

public struct zzz_DflatGen_MyGame_SampleV2_Vec3_Mutable: FlatBufferObject {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Struct

  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Struct(bb: bb, position: o) }

  public var x: Float32 { return _accessor.readBuffer(of: Float32.self, at: 0) }
  public var y: Float32 { return _accessor.readBuffer(of: Float32.self, at: 4) }
  public var z: Float32 { return _accessor.readBuffer(of: Float32.self, at: 8) }
}

public struct zzz_DflatGen_MyGame_SampleV2_Empty: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsEmpty(bb: ByteBuffer) -> zzz_DflatGen_MyGame_SampleV2_Empty {
    return zzz_DflatGen_MyGame_SampleV2_Empty(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  public static func startEmpty(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 0)
  }
  public static func endEmpty(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset {
    let end = Offset(offset: fbb.endTable(at: start))
    return end
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    _v.finish()
  }
}

public struct zzz_DflatGen_MyGame_SampleV2_Monster: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsMonster(bb: ByteBuffer) -> zzz_DflatGen_MyGame_SampleV2_Monster {
    return zzz_DflatGen_MyGame_SampleV2_Monster(
      Table(
        bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))
    )
  }

  private init(_ t: Table) { _accessor = t }
  public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

  private enum VTOFFSET: VOffset {
    case pos = 4
    case mana = 6
    case hp = 8
    case name = 10
    case color = 12
    case inventory = 16
    case weapons = 22
    case equippedType = 24
    case equipped = 26
    case colors = 28
    case path = 30
    case wearType = 32
    case wear = 34
    var v: Int32 { Int32(self.rawValue) }
    var p: VOffset { self.rawValue }
  }

  public var pos: zzz_DflatGen_MyGame_SampleV2_Vec3? {
    let o = _accessor.offset(VTOFFSET.pos.v)
    return o == 0 ? nil : _accessor.readBuffer(of: zzz_DflatGen_MyGame_SampleV2_Vec3.self, at: o)
  }
  public var mutablePos: zzz_DflatGen_MyGame_SampleV2_Vec3_Mutable? {
    let o = _accessor.offset(VTOFFSET.pos.v)
    return o == 0
      ? nil : zzz_DflatGen_MyGame_SampleV2_Vec3_Mutable(_accessor.bb, o: o + _accessor.postion)
  }
  public var mana: Int16 {
    let o = _accessor.offset(VTOFFSET.mana.v)
    return o == 0 ? 150 : _accessor.readBuffer(of: Int16.self, at: o)
  }
  public var hp: Int16 {
    let o = _accessor.offset(VTOFFSET.hp.v)
    return o == 0 ? 100 : _accessor.readBuffer(of: Int16.self, at: o)
  }
  public var name: String? {
    let o = _accessor.offset(VTOFFSET.name.v)
    return o == 0 ? nil : _accessor.string(at: o)
  }
  public var nameSegmentArray: [UInt8]? { return _accessor.getVector(at: VTOFFSET.name.v) }
  public var color: zzz_DflatGen_MyGame_SampleV2_Color {
    let o = _accessor.offset(VTOFFSET.color.v)
    return o == 0
      ? .blue
      : zzz_DflatGen_MyGame_SampleV2_Color(rawValue: _accessor.readBuffer(of: Int8.self, at: o))
        ?? .blue
  }
  public var hasInventory: Bool {
    let o = _accessor.offset(VTOFFSET.inventory.v)
    return o == 0 ? false : true
  }
  public var inventoryCount: Int32 {
    let o = _accessor.offset(VTOFFSET.inventory.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func inventory(at index: Int32) -> UInt8 {
    let o = _accessor.offset(VTOFFSET.inventory.v)
    return o == 0
      ? 0 : _accessor.directRead(of: UInt8.self, offset: _accessor.vector(at: o) + index * 1)
  }
  public var inventory: [UInt8] { return _accessor.getVector(at: VTOFFSET.inventory.v) ?? [] }
  public var hasWeapons: Bool {
    let o = _accessor.offset(VTOFFSET.weapons.v)
    return o == 0 ? false : true
  }
  public var weaponsCount: Int32 {
    let o = _accessor.offset(VTOFFSET.weapons.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func weapons(at index: Int32) -> zzz_DflatGen_MyGame_SampleV2_Weapon? {
    let o = _accessor.offset(VTOFFSET.weapons.v)
    return o == 0
      ? nil
      : zzz_DflatGen_MyGame_SampleV2_Weapon(
        _accessor.bb, o: _accessor.indirect(_accessor.vector(at: o) + index * 4))
  }
  public var equippedType: zzz_DflatGen_MyGame_SampleV2_Equipment {
    let o = _accessor.offset(VTOFFSET.equippedType.v)
    return o == 0
      ? .none_
      : zzz_DflatGen_MyGame_SampleV2_Equipment(
        rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .none_
  }
  public func equipped<T: FlatbuffersInitializable>(type: T.Type) -> T? {
    let o = _accessor.offset(VTOFFSET.equipped.v)
    return o == 0 ? nil : _accessor.union(o)
  }
  public var hasColors: Bool {
    let o = _accessor.offset(VTOFFSET.colors.v)
    return o == 0 ? false : true
  }
  public var colorsCount: Int32 {
    let o = _accessor.offset(VTOFFSET.colors.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func colors(at index: Int32) -> zzz_DflatGen_MyGame_SampleV2_Color? {
    let o = _accessor.offset(VTOFFSET.colors.v)
    return o == 0
      ? zzz_DflatGen_MyGame_SampleV2_Color.red
      : zzz_DflatGen_MyGame_SampleV2_Color(
        rawValue: _accessor.directRead(of: Int8.self, offset: _accessor.vector(at: o) + index * 1))
  }
  public var hasPath: Bool {
    let o = _accessor.offset(VTOFFSET.path.v)
    return o == 0 ? false : true
  }
  public var pathCount: Int32 {
    let o = _accessor.offset(VTOFFSET.path.v)
    return o == 0 ? 0 : _accessor.vector(count: o)
  }
  public func path(at index: Int32) -> zzz_DflatGen_MyGame_SampleV2_Vec3? {
    let o = _accessor.offset(VTOFFSET.path.v)
    return o == 0
      ? nil
      : _accessor.directRead(
        of: zzz_DflatGen_MyGame_SampleV2_Vec3.self, offset: _accessor.vector(at: o) + index * 12)
  }
  public func mutablePath(at index: Int32) -> zzz_DflatGen_MyGame_SampleV2_Vec3_Mutable? {
    let o = _accessor.offset(VTOFFSET.path.v)
    return o == 0
      ? nil
      : zzz_DflatGen_MyGame_SampleV2_Vec3_Mutable(
        _accessor.bb, o: _accessor.vector(at: o) + index * 12)
  }
  public var wearType: zzz_DflatGen_MyGame_SampleV2_Equipment {
    let o = _accessor.offset(VTOFFSET.wearType.v)
    return o == 0
      ? .none_
      : zzz_DflatGen_MyGame_SampleV2_Equipment(
        rawValue: _accessor.readBuffer(of: UInt8.self, at: o)) ?? .none_
  }
  public func wear<T: FlatbuffersInitializable>(type: T.Type) -> T? {
    let o = _accessor.offset(VTOFFSET.wear.v)
    return o == 0 ? nil : _accessor.union(o)
  }
  public static func startMonster(_ fbb: inout FlatBufferBuilder) -> UOffset {
    fbb.startTable(with: 16)
  }
  public static func add(pos: zzz_DflatGen_MyGame_SampleV2_Vec3?, _ fbb: inout FlatBufferBuilder) {
    guard let pos = pos else { return }
    fbb.create(struct: pos, position: VTOFFSET.pos.p)
  }
  public static func add(mana: Int16, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: mana, def: 150, at: VTOFFSET.mana.p)
  }
  public static func add(hp: Int16, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: hp, def: 100, at: VTOFFSET.hp.p)
  }
  public static func add(name: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: name, at: VTOFFSET.name.p)
  }
  public static func add(color: zzz_DflatGen_MyGame_SampleV2_Color, _ fbb: inout FlatBufferBuilder)
  { fbb.add(element: color.rawValue, def: 2, at: VTOFFSET.color.p) }
  public static func addVectorOf(inventory: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: inventory, at: VTOFFSET.inventory.p)
  }
  public static func addVectorOf(weapons: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: weapons, at: VTOFFSET.weapons.p)
  }
  public static func add(
    equippedType: zzz_DflatGen_MyGame_SampleV2_Equipment, _ fbb: inout FlatBufferBuilder
  ) { fbb.add(element: equippedType.rawValue, def: 0, at: VTOFFSET.equippedType.p) }
  public static func add(equipped: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: equipped, at: VTOFFSET.equipped.p)
  }
  public static func addVectorOf(colors: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: colors, at: VTOFFSET.colors.p)
  }
  public static func addVectorOf(path: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: path, at: VTOFFSET.path.p)
  }
  public static func startVectorOfPath(_ size: Int, in builder: inout FlatBufferBuilder) {
    builder.startVector(
      size * MemoryLayout<zzz_DflatGen_MyGame_SampleV2_Vec3>.size,
      elementSize: MemoryLayout<zzz_DflatGen_MyGame_SampleV2_Vec3>.alignment)
  }
  public static func add(
    wearType: zzz_DflatGen_MyGame_SampleV2_Equipment, _ fbb: inout FlatBufferBuilder
  ) { fbb.add(element: wearType.rawValue, def: 0, at: VTOFFSET.wearType.p) }
  public static func add(wear: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: wear, at: VTOFFSET.wear.p)
  }
  public static func endMonster(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset {
    let end = Offset(offset: fbb.endTable(at: start))
    return end
  }
  public static func createMonster(
    _ fbb: inout FlatBufferBuilder,
    pos: zzz_DflatGen_MyGame_SampleV2_Vec3? = nil,
    mana: Int16 = 150,
    hp: Int16 = 100,
    nameOffset name: Offset = Offset(),
    color: zzz_DflatGen_MyGame_SampleV2_Color = .blue,
    inventoryVectorOffset inventory: Offset = Offset(),
    weaponsVectorOffset weapons: Offset = Offset(),
    equippedType: zzz_DflatGen_MyGame_SampleV2_Equipment = .none_,
    equippedOffset equipped: Offset = Offset(),
    colorsVectorOffset colors: Offset = Offset(),
    pathVectorOffset path: Offset = Offset(),
    wearType: zzz_DflatGen_MyGame_SampleV2_Equipment = .none_,
    wearOffset wear: Offset = Offset()
  ) -> Offset {
    let __start = zzz_DflatGen_MyGame_SampleV2_Monster.startMonster(&fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(pos: pos, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(mana: mana, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(hp: hp, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(name: name, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(color: color, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.addVectorOf(inventory: inventory, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.addVectorOf(weapons: weapons, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(equippedType: equippedType, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(equipped: equipped, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.addVectorOf(colors: colors, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.addVectorOf(path: path, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(wearType: wearType, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Monster.add(wear: wear, &fbb)
    return zzz_DflatGen_MyGame_SampleV2_Monster.endMonster(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(
      field: VTOFFSET.pos.p, fieldName: "pos", required: false,
      type: zzz_DflatGen_MyGame_SampleV2_Vec3.self)
    try _v.visit(field: VTOFFSET.mana.p, fieldName: "mana", required: false, type: Int16.self)
    try _v.visit(field: VTOFFSET.hp.p, fieldName: "hp", required: false, type: Int16.self)
    try _v.visit(
      field: VTOFFSET.name.p, fieldName: "name", required: false, type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.color.p, fieldName: "color", required: false,
      type: zzz_DflatGen_MyGame_SampleV2_Color.self)
    try _v.visit(
      field: VTOFFSET.inventory.p, fieldName: "inventory", required: false,
      type: ForwardOffset<Vector<UInt8, UInt8>>.self)
    try _v.visit(
      field: VTOFFSET.weapons.p, fieldName: "weapons", required: false,
      type: ForwardOffset<
        Vector<
          ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Weapon>, zzz_DflatGen_MyGame_SampleV2_Weapon
        >
      >.self)
    try _v.visit(
      unionKey: VTOFFSET.equippedType.p, unionField: VTOFFSET.equipped.p,
      unionKeyName: "equippedType", fieldName: "equipped", required: false,
      completion: { (verifier, key: zzz_DflatGen_MyGame_SampleV2_Equipment, pos) in
        switch key {
        case .none_:
          break  // NOTE - SWIFT doesnt support none
        case .weapon:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Weapon>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Weapon.self)
        case .orb:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Orb>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Orb.self)
        case .empty:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Empty>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Empty.self)
        }
      })
    try _v.visit(
      field: VTOFFSET.colors.p, fieldName: "colors", required: false,
      type: ForwardOffset<
        Vector<zzz_DflatGen_MyGame_SampleV2_Color, zzz_DflatGen_MyGame_SampleV2_Color>
      >.self)
    try _v.visit(
      field: VTOFFSET.path.p, fieldName: "path", required: false,
      type: ForwardOffset<
        Vector<zzz_DflatGen_MyGame_SampleV2_Vec3, zzz_DflatGen_MyGame_SampleV2_Vec3>
      >.self)
    try _v.visit(
      unionKey: VTOFFSET.wearType.p, unionField: VTOFFSET.wear.p, unionKeyName: "wearType",
      fieldName: "wear", required: false,
      completion: { (verifier, key: zzz_DflatGen_MyGame_SampleV2_Equipment, pos) in
        switch key {
        case .none_:
          break  // NOTE - SWIFT doesnt support none
        case .weapon:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Weapon>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Weapon.self)
        case .orb:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Orb>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Orb.self)
        case .empty:
          try ForwardOffset<zzz_DflatGen_MyGame_SampleV2_Empty>.verify(
            &verifier, at: pos, of: zzz_DflatGen_MyGame_SampleV2_Empty.self)
        }
      })
    _v.finish()
  }
}

public struct zzz_DflatGen_MyGame_SampleV2_Weapon: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsWeapon(bb: ByteBuffer) -> zzz_DflatGen_MyGame_SampleV2_Weapon {
    return zzz_DflatGen_MyGame_SampleV2_Weapon(
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
  public static func add(name: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: name, at: VTOFFSET.name.p)
  }
  public static func add(damage: Int16, _ fbb: inout FlatBufferBuilder) {
    fbb.add(element: damage, def: 0, at: VTOFFSET.damage.p)
  }
  public static func endWeapon(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset {
    let end = Offset(offset: fbb.endTable(at: start))
    return end
  }
  public static func createWeapon(
    _ fbb: inout FlatBufferBuilder,
    nameOffset name: Offset = Offset(),
    damage: Int16 = 0
  ) -> Offset {
    let __start = zzz_DflatGen_MyGame_SampleV2_Weapon.startWeapon(&fbb)
    zzz_DflatGen_MyGame_SampleV2_Weapon.add(name: name, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Weapon.add(damage: damage, &fbb)
    return zzz_DflatGen_MyGame_SampleV2_Weapon.endWeapon(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(
      field: VTOFFSET.name.p, fieldName: "name", required: false, type: ForwardOffset<String>.self)
    try _v.visit(field: VTOFFSET.damage.p, fieldName: "damage", required: false, type: Int16.self)
    _v.finish()
  }
}

public struct zzz_DflatGen_MyGame_SampleV2_Orb: FlatBufferObject, Verifiable {

  static func validateVersion() { FlatBuffersVersion_22_9_29() }
  public var __buffer: ByteBuffer! { return _accessor.bb }
  private var _accessor: Table

  public static func getRootAsOrb(bb: ByteBuffer) -> zzz_DflatGen_MyGame_SampleV2_Orb {
    return zzz_DflatGen_MyGame_SampleV2_Orb(
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
  public var color: zzz_DflatGen_MyGame_SampleV2_Color {
    let o = _accessor.offset(VTOFFSET.color.v)
    return o == 0
      ? .red
      : zzz_DflatGen_MyGame_SampleV2_Color(rawValue: _accessor.readBuffer(of: Int8.self, at: o))
        ?? .red
  }
  public static func startOrb(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 2) }
  public static func add(name: Offset, _ fbb: inout FlatBufferBuilder) {
    fbb.add(offset: name, at: VTOFFSET.name.p)
  }
  public static func add(color: zzz_DflatGen_MyGame_SampleV2_Color, _ fbb: inout FlatBufferBuilder)
  { fbb.add(element: color.rawValue, def: 0, at: VTOFFSET.color.p) }
  public static func endOrb(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset {
    let end = Offset(offset: fbb.endTable(at: start))
    return end
  }
  public static func createOrb(
    _ fbb: inout FlatBufferBuilder,
    nameOffset name: Offset = Offset(),
    color: zzz_DflatGen_MyGame_SampleV2_Color = .red
  ) -> Offset {
    let __start = zzz_DflatGen_MyGame_SampleV2_Orb.startOrb(&fbb)
    zzz_DflatGen_MyGame_SampleV2_Orb.add(name: name, &fbb)
    zzz_DflatGen_MyGame_SampleV2_Orb.add(color: color, &fbb)
    return zzz_DflatGen_MyGame_SampleV2_Orb.endOrb(&fbb, start: __start)
  }

  public static func verify<T>(_ verifier: inout Verifier, at position: Int, of type: T.Type) throws
  where T: Verifiable {
    var _v = try verifier.visitTable(at: position)
    try _v.visit(
      field: VTOFFSET.name.p, fieldName: "name", required: false, type: ForwardOffset<String>.self)
    try _v.visit(
      field: VTOFFSET.color.p, fieldName: "color", required: false,
      type: zzz_DflatGen_MyGame_SampleV2_Color.self)
    _v.finish()
  }
}
