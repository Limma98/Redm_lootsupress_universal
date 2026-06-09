# no_vanilla_loot

A lightweight RedM resource that disables the vanilla loot prompt on dead and hogtied human NPCs, while leaving all other interactions intact.

## What it does

- ❌ Removes the vanilla **Loot** prompt on dead human NPCs
- ❌ Removes the vanilla **Loot** prompt on hogtied NPCs
- ✅ Vanilla **Pick Up / Carry** body interaction still works
- ✅ Vanilla **Skin** prompt on dead animals untouched
- ✅ Hat and world object pickups unaffected

## Why

Designed for RP servers that have a custom looting system and don't want the default game loot prompt conflicting or giving players access to vanilla loot.

## Dependencies

None.

## Natives used

| Native | Hash | Purpose |
|---|---|---|
| `_IS_PED_HUMAN` | `0xB980061DA992779D` | Distinguish humans from animals |
| `IsPedHogtied` | `0x3AA24CCC0D451379` | Detect hogtied state |
| `SetLootingFlag` | `0x6569F31A01B4C097` | Disable loot flags on ped |

## Notes

- Animals are completely ignored — skin prompts remain vanilla
- Compatible with any custom loot script (VORP, RSG, BLN, RedemRP etc)
- 0.00ms on idle
