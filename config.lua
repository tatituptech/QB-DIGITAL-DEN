Config = {}

-- NPC Configuration
Config.NPC = {
    model = 'a_m_m_prolhost_01',
    coords = vector3(425.5, -981.5, 29.4),  -- Digital Den location (configurable)
    heading = 180.0,
    name = 'Digital Den Manager',
    blip = true,
    blipSprite = 227,  -- Electronics icon
    blipColor = 3,     -- Blue
    blipScale = 0.8
}

-- Shop Items Configuration
Config.Items = {
    {
        name = 'tatitup-tablet',
        label = 'TatiTup Tablet',
        description = 'A advanced tablet for digital needs',
        price = 15000,
        image = 'tablet.png'
    },
    {
        name = 'qb-linuxx-laptop',
        label = 'LinuXX Laptop',
        description = 'High-performance laptop computer',
        price = 15000,
        image = 'laptop.png'
    },
    {
        name = 'phone',
        label = 'Standard Phone',
        description = 'Basic smartphone device',
        price = 1000,
        image = 'phone.png'
    },
    {
        name = 'iphone',
        label = 'iPhone',
        description = 'Premium smartphone device',
        price = 10000,
        image = 'iphone.png'
    },
    {
        name = 'boombox',
        label = 'Boombox',
        description = 'Portable audio system',
        price = 1000,
        image = 'boombox.png'
    },
    {
        name = 'drone',
        label = 'Drone',
        description = 'Unmanned aerial vehicle',
        price = 25000,
        image = 'drone.png'
    }
}

-- Interaction Distance
Config.InteractionDistance = 3.0
Config.MarkerDistance = 50.0
