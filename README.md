# QB Digital Den - NPC Vendor Script

A complete FiveM QB-Core script that spawns an NPC vendor at a configurable location to sell electronics and tech items.

## Features

✨ **Configurable NPC**
- NPC Model: `a_m_m_prolhost_01`
- Customizable spawn location (Vector3 coords)
- Heading and appearance customization
- Blip marker on map

📱 **Sellable Items**
- TatiTup Tablet ($15,000)
- LinuXX Laptop ($15,000)
- Standard Phone ($1,000)
- iPhone ($10,000)
- Boombox ($1,000)
- Drone ($25,000)

## Installation

1. Download this script to your resources folder
2. Rename folder to `qb-digital-den`
3. Add to your `server.cfg`:
   ```
   ensure qb-digital-den
   ```
4. Ensure you have these dependencies running:
   - qb-core
   - qb-target
   - qb-menu
   - qb-inventory

5. Restart server or run `ensure qb-digital-den`

## Configuration

Edit `config.lua` to customize:

### NPC Location
```lua
Config.NPC.coords = vector3(425.5, -981.5, 29.4)  -- Change to your desired location
```

### NPC Model
```lua
Config.NPC.model = 'a_m_m_prolhost_01'  -- Change to any valid NPC model
```

### Item Prices
```lua
Config.Items = {
    {
        name = 'tatitup-tablet',
        price = 15000,  -- Adjust price here
    },
    -- ... more items
}
```

### Interaction Distance
```lua
Config.InteractionDistance = 3.0  -- How far players can be to interact
```

## Dependencies

- **qb-core** - Core framework
- **qb-target** - Target system for NPC interaction
- **qb-menu** - Menu UI system
- **qb-inventory** - Inventory system

## Usage

1. Approach the NPC at the configured location
2. Target the NPC (aim at them)
3. Select 'Digital Den Shop' from the target menu
4. Choose an item from the shop menu
5. Pay with cash from your inventory

## Commands

Currently no admin commands. All interactions are through the NPC.

## Troubleshooting

**NPC not appearing?**
- Check console for errors
- Verify coordinates are valid in-game
- Ensure model `a_m_m_prolhost_01` exists
- Check that the script is listed in server.cfg with `ensure`

**Can't interact with NPC?**
- Make sure qb-target is running and enabled
- Check interaction distance in config
- Verify you're aiming at the NPC

**Can't buy items?**
- Ensure you have enough cash
- Check console for script errors
- Verify all dependencies are running
- Check that item names exist in your database

## File Structure

```
qb-digital-den/
├── fxmanifest.lua      -- Manifest file
├── config.lua          -- Configuration file
├── server/
│   └── main.lua        -- Server-side logic
├── client/
│   └── main.lua        -- Client-side logic
└── README.md           -- This file
```

## License

MIT - Feel free to modify and distribute

## Support

For issues, create an issue on the GitHub repository.
