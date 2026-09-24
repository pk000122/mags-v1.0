--[[
    Key System + Modern Hub UI
    - Animated key screen (shake on wrong key, saves key after success)
    - Floating-panel main window with sidebar tabs, user card, minimize
    - Elements: Button, Toggle, Slider, Dropdown, Input, Info, Section
    - Toast notifications, smooth animations, Right Shift to show/hide
]]

--// ==========================
--//         CONFIG
--// ==========================
local CONFIG = {
    Key         = "DEV",
    GetKeyLink  = "https://discord.gg/hqpUbvd7y", -- copied to clipboard by "Get Key"
    Title       = "Mags",
    Version     = "v1.0",
    ToggleKey   = Enum.KeyCode.RightShift,
    SaveKey     = true,                         -- remember the key after success
    SaveFile    = "MyHub_Key.txt",
   }
local THEME = {
    Background  = Color3.fromRGB(16, 16, 22),
    Surface     = Color3.fromRGB(24, 24, 32),
    Element     = Color3.fromRGB(33, 33, 44),
    ElementHover= Color3.fromRGB(44, 44, 58),
    Stroke      = Color3.fromRGB(52, 52, 70),
    Text        = Color3.fromRGB(240, 240, 250),
    SubText     = Color3.fromRGB(150, 150, 172),
    Accent      = Color3.fromRGB(120, 90, 255),
    Accent2     = Color3.fromRGB(64, 160, 255),
    Success     = Color3.fromRGB(70, 200, 120),
    Error       = Color3.fromRGB(240, 80, 90),
}

--// ==========================
--//        SERVICES
--// ==========================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

--// ==========================
--//     GUI ROOT / CLEANUP
--// ==========================
local function getParent()
    local ok, result = pcall(function()
        return (gethui and gethui()) or game:GetService("CoreGui")
    end)
    if ok and result then return result end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local root = getParent()
local old = root:FindFirstChild("KeySystemUI")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = root

--// Track every connection so destroying the UI cleans up fully
local connections = {}
local function connect(signal, fn)
    local c = signal:Connect(fn)
    table.insert(connections, c)
    return c
end

gui.Destroying:Connect(function()
    for _, c in ipairs(connections) do
        pcall(function() c:Disconnect() end)
    end
end)

--// ==========================
--//        HELPERS
--// ==========================
local function new(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then inst[k] = v end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    if props and props.Parent then inst.Parent = props.Parent end
    return inst
end

local function tween(obj, time, props, style)
    local tw = TweenService:Create(
        obj,
        TweenInfo.new(time, style or Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        props
    )
    tw:Play()
    return tw
end

local function corner(r)
    return new("UICorner", { CornerRadius = UDim.new(0, r) })
end

local function stroke(color, thickness)
    return new("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function accentGradient(rotation)
    return new("UIGradient", {
        Color = ColorSequence.new(THEME.Accent, THEME.Accent2),
        Rotation = rotation or 0,
    })
end

local function label(props)
    local p = {
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    for k, v in pairs(props) do p[k] = v end
    return new("TextLabel", p)
end

local function safe(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then warn("[UI] " .. tostring(err)) end
end

local orderCounter = 0
local function nextOrder()
    orderCounter += 1
    return orderCounter
end

local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragStart, startPos

    connect(handle.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local function iconButton(parent, text, pos, hoverColor, callback)
    local b = new("TextButton", {
        Size = UDim2.new(0, 26, 0, 26),
        Position = pos,
        BackgroundColor3 = THEME.Element,
        Text = text,
        TextColor3 = THEME.SubText,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        AutoButtonColor = false,
        Parent = parent,
    }, { corner(6) })

    b.MouseEnter:Connect(function()
        tween(b, 0.15, { BackgroundColor3 = hoverColor, TextColor3 = Color3.new(1, 1, 1) })
    end)
    b.MouseLeave:Connect(function()
        tween(b, 0.15, { BackgroundColor3 = THEME.Element, TextColor3 = THEME.SubText })
    end)
    b.MouseButton1Click:Connect(callback)
    return b
end

--// Big action button (primary = gradient, secondary = flat)
local function actionButton(props, text, primary)
    props.BackgroundColor3 = primary and Color3.new(1, 1, 1) or THEME.Element
    props.Text = ""
    props.AutoButtonColor = false
    local b = new("TextButton", props, { corner(8) })
    if primary then
        accentGradient(0).Parent = b
    else
        stroke(THEME.Stroke, 1).Parent = b
    end
    local l = label({
        Size = UDim2.new(1, 0, 1, 0),
        Text = text,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = b,
    })
    b.MouseEnter:Connect(function()
        if primary then
            tween(b, 0.15, { BackgroundTransparency = 0.15 })
        else
            tween(b, 0.15, { BackgroundColor3 = THEME.ElementHover })
        end
    end)
    b.MouseLeave:Connect(function()
        if primary then
            tween(b, 0.15, { BackgroundTransparency = 0 })
        else
            tween(b, 0.15, { BackgroundColor3 = THEME.Element })
        end
    end)
    return b, l
end

--// ==========================
--//    SHOW / HIDE (hotkey)
--// ==========================
local activeScale = nil
local visible = true

local function setVisible(v)
    visible = v
    if v then
        gui.Enabled = true
        if activeScale then
            activeScale.Scale = 0.9
            tween(activeScale, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
        end
    else
        if activeScale then
            tween(activeScale, 0.15, { Scale = 0.9 })
        end
        task.delay(0.15, function()
            if not visible then gui.Enabled = false end
        end)
    end
end

connect(UserInputService.InputBegan, function(input)
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if input.KeyCode ~= CONFIG.ToggleKey then return end
    if UserInputService:GetFocusedTextBox() then return end
    setVisible(not visible)
end)

--// ==========================
--//     NOTIFICATIONS
--// ==========================
local notifHolder = new("Frame", {
    Name = "Notifications",
    Size = UDim2.new(0, 280, 1, -24),
    Position = UDim2.new(1, -292, 0, 12),
    BackgroundTransparency = 1,
    ZIndex = 100,
    Parent = gui,
}, {
    new("UIListLayout", {
        Padding = UDim.new(0, 8),
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }),
})

local function notify(title, text, duration, color)
    color = color or THEME.Accent
    local holder = new("Frame", {
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = notifHolder,
    })
    local card = new("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(1, 40, 0, 0),
        BackgroundColor3 = THEME.Surface,
        Parent = holder,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    new("Frame", {
        Size = UDim2.new(0, 3, 1, -20),
        Position = UDim2.new(0, 8, 0, 10),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        Parent = card,
    }, { corner(2) })

    label({
        Size = UDim2.new(1, -34, 0, 18),
        Position = UDim2.new(0, 22, 0, 8),
        Text = title,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        Parent = card,
    })
    label({
        Size = UDim2.new(1, -34, 0, 28),
        Position = UDim2.new(0, 22, 0, 26),
        Text = text,
        TextSize = 12,
        TextColor3 = THEME.SubText,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = card,
    })

    tween(card, 0.4, { Position = UDim2.new(0, 0, 0, 0) }, Enum.EasingStyle.Back)

    task.delay(duration or 3, function()
        if not card.Parent then return end
        local tw = tween(card, 0.25, { Position = UDim2.new(1, 40, 0, 0) })
        tw.Completed:Wait()
        if holder.Parent then holder:Destroy() end
    end)
end

--// ==========================
--//     UI ELEMENT BUILDERS
--// ==========================
local function baseRow(page, height)
    return new("Frame", {
        Size = UDim2.new(1, 0, 0, height or 38),
        BackgroundColor3 = THEME.Element,
        BorderSizePixel = 0,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })
end

local function addSection(page, text)
    label({
        Size = UDim2.new(1, 0, 0, 22),
        Text = string.upper(text),
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = THEME.SubText,
        LayoutOrder = nextOrder(),
        Parent = page,
    })
end

local function addInfo(page, key, value)
    local row = baseRow(page, 34)
    label({
        Size = UDim2.new(0.4, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = key,
        TextColor3 = THEME.SubText,
        TextSize = 13,
        Parent = row,
    })
    return label({
        Size = UDim2.new(0.6, -14, 1, 0),
        Position = UDim2.new(0.4, 0, 0, 0),
        Text = tostring(value),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = row,
    })
end

local function addButton(page, text, callback)
    local row = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    label({
        Size = UDim2.new(1, -44, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    label({
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        Text = ">",
        Font = Enum.Font.GothamBold,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = row,
    })

    row.MouseEnter:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.ElementHover }) end)
    row.MouseLeave:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.Element }) end)
    row.MouseButton1Click:Connect(function() safe(callback) end)
end

local function addToggle(page, text, default, callback)
    local state = default or false
    local row = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    label({
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })

    local track = new("Frame", {
        Size = UDim2.new(0, 40, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        BackgroundColor3 = state and THEME.Accent or THEME.Stroke,
        Parent = row,
    }, { corner(10) })

    local knob = new("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = state and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = track,
    }, { corner(7) })

    local function set(v, silent)
        state = v
        tween(track, 0.2, { BackgroundColor3 = v and THEME.Accent or THEME.Stroke })
        tween(knob, 0.2, { Position = v and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0) })
        if not silent then safe(callback, v) end
    end

    row.MouseEnter:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.ElementHover }) end)
    row.MouseLeave:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.Element }) end)
    row.MouseButton1Click:Connect(function() set(not state) end)

    return { Set = function(v) set(v, true) end }
end

local function addSlider(page, text, min, max, default, callback)
    local value = math.clamp(default or min, min, max)
    local row = baseRow(page, 54)

    label({
        Size = UDim2.new(1, -80, 0, 30),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    local valueLabel = label({
        Size = UDim2.new(0, 60, 0, 30),
        Position = UDim2.new(1, -74, 0, 0),
        Text = tostring(value),
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = row,
    })

    local track = new("Frame", {
        Size = UDim2.new(1, -28, 0, 6),
        Position = UDim2.new(0, 14, 0, 37),
        BackgroundColor3 = THEME.Stroke,
        Parent = row,
    }, { corner(3) })

    local fill = new("Frame", {
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = track,
    }, { corner(3), accentGradient(0) })

    new("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = fill,
    }, { corner(7) })

    --// Bigger invisible hitbox so it's easy to grab
    local hit = new("TextButton", {
        Size = UDim2.new(1, -28, 0, 24),
        Position = UDim2.new(0, 14, 0, 28),
        BackgroundTransparency = 1,
        Text = "",
        Parent = row,
    })

    local dragging = false
    local function setFromX(x)
        local a = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + (max - min) * a + 0.5)
        if newValue == value then return end
        value = newValue
        valueLabel.Text = tostring(value)
        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
        safe(callback, value)
    end

    hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            setFromX(input.Position.X)
        end
    end)
    connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            setFromX(input.Position.X)
        end
    end)
    connect(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function addDropdown(page, text, options, default, callback)
    local selected = default or options[1]
    local open = false

    local frame = new("Frame", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        ClipsDescendants = true,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    local header = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundTransparency = 1,
        Text = "",
        Parent = frame,
    })
    label({
        Size = UDim2.new(0.5, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = header,
    })
    local selectedLabel = label({
        Size = UDim2.new(0.5, -40, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        Text = selected,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = header,
    })
    local arrow = label({
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = header,
    })

    local optionButtons = {}
    local function refresh()
        for opt, btn in pairs(optionButtons) do
            btn.TextColor3 = (opt == selected) and THEME.Accent2 or THEME.SubText
        end
        selectedLabel.Text = selected
    end

    local function setOpen(v)
        open = v
        tween(frame, 0.25, { Size = UDim2.new(1, 0, 0, v and (38 + #options * 30 + 8) or 38) })
        tween(arrow, 0.25, { Rotation = v and 180 or 0 })
    end

    for i, opt in ipairs(options) do
        local ob = new("TextButton", {
            Size = UDim2.new(1, -12, 0, 26),
            Position = UDim2.new(0, 6, 0, 40 + (i - 1) * 30),
            BackgroundColor3 = THEME.Background,
            Text = opt,
            TextColor3 = THEME.SubText,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            AutoButtonColor = false,
            Parent = frame,
        }, { corner(6) })
        optionButtons[opt] = ob
        ob.MouseButton1Click:Connect(function()
            selected = opt
            refresh()
            setOpen(false)
            safe(callback, opt)
        end)
    end

    header.MouseButton1Click:Connect(function() setOpen(not open) end)
    refresh()
end

local function addInput(page, text, placeholder, callback)
    local row = baseRow(page, 38)
    label({
        Size = UDim2.new(0.5, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    local box = new("TextBox", {
        Size = UDim2.new(0.5, -20, 0, 26),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        Text = "",
        PlaceholderText = placeholder or "",
        PlaceholderColor3 = THEME.SubText,
        TextColor3 = THEME.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        ClearTextOnFocus = false,
        Parent = row,
    }, { corner(6), stroke(THEME.Stroke, 1) })

    local s = box:FindFirstChildOfClass("UIStroke")
    box.Focused:Connect(function() tween(s, 0.15, { Color = THEME.Accent }) end)
    box.FocusLost:Connect(function(enter)
        tween(s, 0.15, { Color = THEME.Stroke })
        if enter then safe(callback, box.Text) end
    end)
end

--// ==========================
--//    KEY SAVE / LOAD
--// ==========================
local function loadSavedKey()
    if not CONFIG.SaveKey then return nil end
    local ok, result = pcall(function()
        if isfile and readfile and isfile(CONFIG.SaveFile) then
            return readfile(CONFIG.SaveFile)
        end
    end)
    return ok and result or nil
end

local function saveKey(k)
    if CONFIG.SaveKey and writefile then
        pcall(writefile, CONFIG.SaveFile, k)
    end
end

--// ==========================
--//        MAIN WINDOW
--// ==========================
local function buildMain()
    local W, H = 640, 420

    local main = new("Frame", {
        Name = "Main",
        Size = UDim2.new(0, W, 0, H),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        ClipsDescendants = true,
        Parent = gui,
    }, { corner(14), stroke(THEME.Stroke, 1) })

    local scale = new("UIScale", { Parent = main })
    activeScale = scale
    scale.Scale = 0.85
    tween(scale, 0.4, { Scale = 1 }, Enum.EasingStyle.Back)

    --// Top bar
    local topbar = new("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundTransparency = 1,
        Active = true,
        Parent = main,
    })
    makeDraggable(main, topbar)

    new("Frame", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 14, 0, 12),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = topbar,
    }, { corner(6), accentGradient(45) })

    label({
        Size = UDim2.new(1, -160, 1, 0),
        Position = UDim2.new(0, 46, 0, 0),
        Text = CONFIG.Title .. '  <font color="rgb(150,150,172)" size="12">' .. CONFIG.Version .. "</font>",
        RichText = true,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        Parent = topbar,
    })

    local minimized = false
    iconButton(topbar, "-", UDim2.new(1, -72, 0, 10), THEME.ElementHover, function()
        minimized = not minimized
        local shift = (H - 46) / 2
        tween(main, 0.3, {
            Size = UDim2.new(0, W, 0, minimized and 46 or H),
            Position = main.Position + UDim2.new(0, 0, 0, minimized and -shift or shift),
        })
    end)
    iconButton(topbar, "X", UDim2.new(1, -40, 0, 10), THEME.Error, function()
        gui:Destroy()
    end)

    --// Sidebar
    local sidebar = new("Frame", {
        Size = UDim2.new(0, 150, 1, -60),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundColor3 = THEME.Surface,
        Parent = main,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    local tabHolder = new("Frame", {
        Size = UDim2.new(1, -16, 1, -76),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundTransparency = 1,
        Parent = sidebar,
    }, {
        new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }),
    })

    --// User card (bottom of sidebar)
    local userCard = new("Frame", {
        Size = UDim2.new(1, -16, 0, 50),
        Position = UDim2.new(0, 8, 1, -58),
        BackgroundColor3 = THEME.Element,
        Parent = sidebar,
    }, { corner(8) })

    local avatar = new("ImageLabel", {
        Size = UDim2.new(0, 34, 0, 34),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundColor3 = THEME.Background,
        Image = "",
        Parent = userCard,
    }, { corner(17) })

    task.spawn(function()
        local ok, img = pcall(function()
            return Players:GetUserThumbnailAsync(
                LocalPlayer.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
        end)
        if ok and avatar.Parent then avatar.Image = img end
    end)

    label({
        Size = UDim2.new(1, -52, 0, 16),
        Position = UDim2.new(0, 48, 0, 9),
        Text = LocalPlayer.DisplayName,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = userCard,
    })
    label({
        Size = UDim2.new(1, -52, 0, 14),
        Position = UDim2.new(0, 48, 0, 26),
        Text = "@" .. LocalPlayer.Name,
        TextSize = 11,
        TextColor3 = THEME.SubText,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = userCard,
    })

    --// Content panel
    local content = new("Frame", {
        Size = UDim2.new(1, -178, 1, -60),
        Position = UDim2.new(0, 168, 0, 50),
        BackgroundColor3 = THEME.Surface,
        Parent = main,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    local header = label({
        Size = UDim2.new(1, -28, 0, 34),
        Position = UDim2.new(0, 14, 0, 4),
        Text = "",
        Font = Enum.Font.GothamBold,
        TextSize = 17,
        Parent = content,
    })

    --// Tabs
    local tabs = {}
    local selectedTab = nil

    local function selectTab(name)
        selectedTab = name
        for n, t in pairs(tabs) do
            local on = (n == name)
            t.page.Visible = on
            tween(t.button, 0.2, { BackgroundTransparency = on and 0 or 1 })
            tween(t.indicator, 0.2, {
                BackgroundTransparency = on and 0 or 1,
                Size = UDim2.new(0, 3, 0, on and 16 or 0),
            })
            tween(t.text, 0.2, { TextColor3 = on and THEME.Text or THEME.SubText })
        end
        header.Text = name
    end

    local function createTab(name, icon)
        local button = new("TextButton", {
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = THEME.Element,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = nextOrder(),
            Parent = tabHolder,
        }, { corner(8) })

        local indicator = new("Frame", {
            Size = UDim2.new(0, 3, 0, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 4, 0.5, 0),
            BackgroundColor3 = THEME.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Parent = button,
        }, { corner(2) })

        local text = label({
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 18, 0, 0),
            Text = (icon and (icon .. "  ") or "") .. name,
            TextColor3 = THEME.SubText,
            Font = Enum.Font.GothamMedium,
            Parent = button,
        })

        local page = new("ScrollingFrame", {
            Name = name,
            Size = UDim2.new(1, -16, 1, -46),
            Position = UDim2.new(0, 8, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = THEME.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            Parent = content,
        }, {
            new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }),
            new("UIPadding", { PaddingRight = UDim.new(0, 8), PaddingBottom = UDim.new(0, 4) }),
        })

        button.MouseEnter:Connect(function()
            if selectedTab ~= name then tween(button, 0.15, { BackgroundTransparency = 0.5 }) end
        end)
        button.MouseLeave:Connect(function()
            if selectedTab ~= name then tween(button, 0.15, { BackgroundTransparency = 1 }) end
        end)
        button.MouseButton1Click:Connect(function() selectTab(name) end)

        tabs[name] = { page = page, button = button, indicator = indicator, text = text }
        return page
    end

    --// ============ YOUR TABS ============
    local function getHumanoid()
        local c = LocalPlayer.Character
        return c and c:FindFirstChildOfClass("Humanoid")
    end

    -- HOME
    local home = createTab("Home", "H")
    local hero = new("Frame", {
        Size = UDim2.new(1, 0, 0, 78),
        BackgroundColor3 = Color3.new(1, 1, 1),
        LayoutOrder = nextOrder(),
        Parent = home,
    }, { corner(10), accentGradient(25) })
    label({
        Size = UDim2.new(1, -32, 0, 24),
        Position = UDim2.new(0, 16, 0, 14),
        Text = "Welcome, " .. LocalPlayer.DisplayName,
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        Parent = hero,
    })
    label({
        Size = UDim2.new(1, -32, 0, 20),
        Position = UDim2.new(0, 16, 0, 44),
        Text = "Press " .. CONFIG.ToggleKey.Name .. " to show or hide this menu",
        TextSize = 12,
        TextColor3 = Color3.fromRGB(235, 235, 255),
        Parent = hero,
    })

    local gameName = "Unknown"
    pcall(function()
        gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    addSection(home, "Game")
    addInfo(home, "Name", gameName)
    addInfo(home, "Place ID", game.PlaceId)
    addInfo(home, "Players", #Players:GetPlayers() .. " / " .. Players.MaxPlayers)

    -- PLAYER
    local plr = createTab("Player", "P")
    addSection(plr, "Movement")
    local hum = getHumanoid()
    addSlider(plr, "Walk Speed", 16, 200, hum and math.floor(hum.WalkSpeed) or 16, function(v)
        local h = getHumanoid()
        if h then h.WalkSpeed = v end
    end)
    addSlider(plr, "Jump Power", 50, 300, 50, function(v)
        local h = getHumanoid()
        if h then
            h.UseJumpPower = true
            h.JumpPower = v
        end
    end)

    local jumpConn
    addToggle(plr, "Infinite Jump", false, function(on)
        if on then
            jumpConn = connect(UserInputService.JumpRequest, function()
                local h = getHumanoid()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        elseif jumpConn then
            jumpConn:Disconnect()
            jumpConn = nil
        end
    end)

    addSection(plr, "Character")
    addButton(plr, "Reset Character", function()
        local h = getHumanoid()
        if h then h.Health = 0 end
    end)

    -- SCRIPTS
    local scripts = createTab("Scripts", "R")

    local function getRoot()
        local c = LocalPlayer.Character
        return c and c:FindFirstChild("HumanoidRootPart")
    end

    ---------- FLY ----------
    addSection(scripts, "Fly  (WASD, Space = up, Ctrl = down)")

    local flySpeed = 60
    local bodyVel, bodyGyro, flyConn
    local flyToggle

    local function stopFly()
        if flyConn then flyConn:Disconnect() flyConn = nil end
        if bodyVel then bodyVel:Destroy() bodyVel = nil end
        if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
        local h = getHumanoid()
        if h then h.PlatformStand = false end
    end

    local function startFly()
        local hrp = getRoot()
        local h = getHumanoid()
        if not hrp or not h then
            notify("Fly failed", "Character not found.", 3, THEME.Error)
            return false
        end

        stopFly()
        h.PlatformStand = true

        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.Parent = hrp

        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bodyGyro.P = 9e4
        bodyGyro.CFrame = hrp.CFrame
        bodyGyro.Parent = hrp

        flyConn = connect(RunService.RenderStepped, function()
            local cam = workspace.CurrentCamera
            if not cam or not hrp.Parent then
                stopFly()
                if flyToggle then flyToggle.Set(false) end
                return
            end

            local dir = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end

            bodyVel.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.new(0, 0, 0)
            bodyGyro.CFrame = cam.CFrame
        end)
        return true
    end

    flyToggle = addToggle(scripts, "Fly", false, function(on)
        if on then
            if not startFly() then flyToggle.Set(false) end
        else
            stopFly()
        end
    end)
    addSlider(scripts, "Fly Speed", 10, 300, flySpeed, function(v) flySpeed = v end)

    gui.Destroying:Connect(stopFly)

    ---------- NOCLIP ----------
    addSection(scripts, "Movement")
    local noclipConn
    addToggle(scripts, "Noclip", false, function(on)
        if on then
            noclipConn = connect(RunService.Stepped, function()
                local c = LocalPlayer.Character
                if not c then return end
                for _, p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end)
        elseif noclipConn then
            noclipConn:Disconnect()
            noclipConn = nil
        end
    end)

    ---------- TELEPORT ----------
    addSection(scripts, "Teleport")

    local function findPlayer(query)
        query = query:lower()
        if query == "" then return nil end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer
                and (p.Name:lower():sub(1, #query) == query
                or p.DisplayName:lower():sub(1, #query) == query) then
                return p
            end
        end
    end

    addInput(scripts, "To Player", "name + Enter", function(text)
        local target = findPlayer(text)
        local hrp = getRoot()
        local targetRoot = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if hrp and targetRoot then
            hrp.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
            notify("Teleported", "Now near " .. target.DisplayName, 2, THEME.Success)
        else
            notify("Teleport failed", "Player not found.", 3, THEME.Error)
        end
    end)

    addInput(scripts, "To Coords", "x, y, z + Enter", function(text)
        local x, y, z = text:match("^%s*(-?[%d%.]+)[,%s]+(-?[%d%.]+)[,%s]+(-?[%d%.]+)%s*$")
        x, y, z = tonumber(x), tonumber(y), tonumber(z)
        local hrp = getRoot()
        if hrp and x and y and z then
            hrp.CFrame = CFrame.new(x, y, z)
            notify("Teleported", string.format("%d, %d, %d", x, y, z), 2, THEME.Success)
        else
            notify("Teleport failed", "Use the format: 100, 50, -20", 3, THEME.Error)
        end
    end)

    local savedCFrame
    addButton(scripts, "Save Position", function()
        local hrp = getRoot()
        if hrp then
            savedCFrame = hrp.CFrame
            notify("Position saved", "Use 'Teleport to Saved' to return.", 2, THEME.Success)
        end
    end)
    addButton(scripts, "Teleport to Saved", function()
        local hrp = getRoot()
        if hrp and savedCFrame then
            hrp.CFrame = savedCFrame
        else
            notify("No saved position", "Press 'Save Position' first.", 3, THEME.Error)
        end
    end)
    addButton(scripts, "Copy Current Position", function()
        local hrp = getRoot()
        if not hrp then return end
        local p = hrp.Position
        local str = string.format("%d, %d, %d", p.X, p.Y, p.Z)
        local ok = pcall(function() setclipboard(str) end)
        notify(ok and "Copied" or "Position", str, 3)
    end)

    local clickTp = false
    local mouse = LocalPlayer:GetMouse()
    addToggle(scripts, "Ctrl + Click Teleport", false, function(on) clickTp = on end)
    connect(UserInputService.InputBegan, function(input, processed)
        if not clickTp or processed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1
            and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            local hrp = getRoot()
            if hrp and mouse.Hit then
                hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end
    end)

    ---------- EXTERNAL HUBS ----------
    addSection(scripts, "External Scripts")

    local hubKey = CONFIG.HubKey
    addInput(scripts, "Hub Key", "optional + Enter", function(text)
        hubKey = text
        notify("Hub key set", text ~= "" and "Key will be used on load." or "Key cleared.", 2)
    end)
    addButton(scripts, "Load Jager Hub", function()
        if hubKey ~= "" then
            (getgenv and getgenv() or _G).script_key = hubKey
        end
        notify("Loading...", "Fetching the Jager Hub loader.", 3)
        local ok, err = pcall(function()
            loadstring(game:HttpGet(CONFIG.HubURL))()
        end)
        if not ok then
            notify("Load failed", tostring(err), 5, THEME.Error)
        end
    end)

    -- FOOTBALL
    local fb = createTab("Football", "F")

    ---------- BALL (Mag) ----------
    addSection(fb, "Ball")

    local magOn, ballEspOn = false, false
    local magRange = 25
    local ballName = ""           -- leave empty = auto-detect ("Football" / "Ball")
    local ballCache = {}
    local lastScan = 0

    local ballFolder = Instance.new("Folder")
    ballFolder.Name = "BallESP"
    ballFolder.Parent = gui

    local function isBall(part)
        if not part:IsA("BasePart") then return false end
        local n = part.Name:lower()

        --// A name picked/typed by the user is trusted, no other filters
        if ballName ~= "" then return n == ballName:lower() end

        --// Auto-detect: name must look like a ball...
        if not (n:find("football", 1, true) or n == "ball") then return false end
        --// ...and it can't be a fixed decoration (statues, field logos)
        if part.Anchored then return false end
        local s = part.Size
        if math.max(s.X, s.Y, s.Z) > 6 then return false end
        return true
    end

    local function scanBalls()
        ballCache = {}
        ballFolder:ClearAllChildren()
        for _, d in ipairs(workspace:GetDescendants()) do
            if isBall(d) then
                --// ignore parts that belong to a player's character
                local m = d:FindFirstAncestorOfClass("Model")
                if not (m and m:FindFirstChildOfClass("Humanoid")) then
                    table.insert(ballCache, d)
                    if ballEspOn then
                        new("Highlight", {
                            Adornee = d,
                            FillColor = Color3.fromRGB(255, 200, 60),
                            FillTransparency = 0.3,
                            OutlineColor = Color3.new(1, 1, 1),
                            Parent = ballFolder,
                        })
                    end
                end
            end
        end
    end

    connect(RunService.Heartbeat, function()
        if not (magOn or ballEspOn) then return end

        local now = os.clock()
        if now - lastScan > 2 then
            lastScan = now
            scanBalls()
        end

        if not magOn or not firetouchinterest then return end
        local hrp = getRoot()
        if not hrp then return end

        --// Touch with the root part AND hands/arms (catches often check those)
        local touchers = { hrp }
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p:IsA("BasePart") and (p.Name:find("Hand") or p.Name:find("Arm")) then
                    table.insert(touchers, p)
                end
            end
        end

        for _, ball in ipairs(ballCache) do
            if ball.Parent and (ball.Position - hrp.Position).Magnitude <= magRange then
                for _, part in ipairs(touchers) do
                    firetouchinterest(part, ball, 0)
                    firetouchinterest(part, ball, 1)
                end
            end
        end
    end)

    addToggle(fb, "Mag (auto-touch ball in range)", false, function(on)
        magOn = on
        lastScan = 0
        if on and not firetouchinterest then
            notify("Not supported", "Your executor has no firetouchinterest.", 4, THEME.Error)
        end
    end)
    addSlider(fb, "Mag Range", 5, 60, magRange, function(v) magRange = v end)

    addToggle(fb, "Ball ESP", false, function(on)
        ballEspOn = on
        lastScan = 0
        if not on then ballFolder:ClearAllChildren() end
    end)

    addInput(fb, "Ball Name", "default: auto", function(text)
        ballName = text
        lastScan = 0
        notify("Ball name set", text ~= "" and text or "Auto-detect", 2)
    end)

    --// Click-to-pick: click the real ball in the world to lock onto its name
    local picking = false
    local pickMouse = LocalPlayer:GetMouse()
    addButton(fb, "Pick Ball (then click the ball)", function()
        picking = true
        notify("Pick mode", "Click the football in the world.", 4)
    end)
    connect(UserInputService.InputBegan, function(input, processed)
        if not picking or processed then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        local target = pickMouse.Target
        if not target then return end
        picking = false
        ballName = target.Name
        lastScan = 0
        notify("Ball set: " .. target.Name, string.format(
            "Anchored: %s  Size: %d x %d x %d",
            tostring(target.Anchored), target.Size.X, target.Size.Y, target.Size.Z
        ), 5, THEME.Success)
        print("[Ball] picked:", target:GetFullName())
    end)

    addButton(fb, "Ball Info (prints to F9 console)", function()
        scanBalls()
        notify("Ball scan", #ballCache .. " ball(s) found. Check the F9 console.", 4)
        for _, b in ipairs(ballCache) do
            print("[Ball]", b:GetFullName(), "Anchored:", b.Anchored, "Size:", b.Size)
        end
    end)

    addButton(fb, "Teleport to Ball", function()
        scanBalls()
        local hrp = getRoot()
        if not hrp then return end
        local nearest, best = nil, math.huge
        for _, ball in ipairs(ballCache) do
            local d = (ball.Position - hrp.Position).Magnitude
            if d < best then nearest, best = ball, d end
        end
        if nearest then
            hrp.CFrame = nearest.CFrame + Vector3.new(0, 4, 0)
        else
            notify("No ball found", "Try setting the Ball Name above.", 3, THEME.Error)
        end
    end)

    ---------- ESP ----------
    addSection(fb, "Players")

    local espOn = false
    local espFolder = Instance.new("Folder")
    espFolder.Name = "PlayerESP"
    espFolder.Parent = gui

    local function applyESP(p)
        if p == LocalPlayer then return end
        local existing = espFolder:FindFirstChild(p.Name)
        if existing then existing:Destroy() end
        if not espOn or not p.Character then return end
        new("Highlight", {
            Name = p.Name,
            Adornee = p.Character,
            FillColor = (p.Team and p.Team.TeamColor.Color) or THEME.Accent,
            FillTransparency = 0.6,
            OutlineColor = Color3.new(1, 1, 1),
            Parent = espFolder,
        })
    end

    local function watchPlayer(p)
        connect(p.CharacterAdded, function()
            task.wait(0.5)
            applyESP(p)
        end)
    end
    for _, p in ipairs(Players:GetPlayers()) do watchPlayer(p) end
    connect(Players.PlayerAdded, watchPlayer)
    connect(Players.PlayerRemoving, function(p)
        local h = espFolder:FindFirstChild(p.Name)
        if h then h:Destroy() end
    end)

    addToggle(fb, "Player ESP (team colors)", false, function(on)
        espOn = on
        for _, p in ipairs(Players:GetPlayers()) do applyESP(p) end
    end)

    ---------- MISC ----------
    addSection(fb, "Misc")

    local cam = workspace.CurrentCamera
    addSlider(fb, "Field of View", 40, 120, cam and math.floor(cam.FieldOfView) or 70, function(v)
        local c = workspace.CurrentCamera
        if c then c.FieldOfView = v end
    end)

    local afkConn
    addToggle(fb, "Anti-AFK", false, function(on)
        if on then
            afkConn = connect(LocalPlayer.Idled, function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        elseif afkConn then
            afkConn:Disconnect()
            afkConn = nil
        end
    end)

    -- SETTINGS
    local settings = createTab("Settings", "S")
    addSection(settings, "Interface")
    addDropdown(settings, "Notification Style", { "Info", "Success", "Error" }, "Info", function(opt)
        notify("Style changed", "Selected: " .. opt, 2)
    end)
    addInput(settings, "Send Message", "Type + Enter", function(text)
        if text ~= "" then notify("Message", text, 3) end
    end)
    addToggle(settings, "Show Welcome Toasts", true, function(on)
        notify("Setting saved", "Welcome toasts " .. (on and "enabled" or "disabled"), 2, THEME.Success)
    end)
    addSection(settings, "Danger Zone")
    addButton(settings, "Destroy UI", function() gui:Destroy() end)
    --// ===================================

    selectTab("Home")
    notify("Welcome!", "Loaded successfully. Press " .. CONFIG.ToggleKey.Name .. " to hide.", 4, THEME.Success)
end

--// ==========================
--//        KEY SCREEN
--// ==========================
local function buildKeyScreen()
    local card = new("Frame", {
        Name = "KeyCard",
        Size = UDim2.new(0, 400, 0, 306),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        Parent = gui,
    }, { corner(14), stroke(THEME.Stroke, 1) })

    local scale = new("UIScale", { Parent = card })
    activeScale = scale
    scale.Scale = 0.85
    tween(scale, 0.4, { Scale = 1 }, Enum.EasingStyle.Back)
    makeDraggable(card)

    --// Accent bar
    new("Frame", {
        Size = UDim2.new(1, -40, 0, 3),
        Position = UDim2.new(0, 20, 0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = card,
    }, { corner(2), accentGradient(0) })

    iconButton(card, "X", UDim2.new(1, -38, 0, 12), THEME.Error, function()
        gui:Destroy()
    end)

    --// Logo
    local logo = new("Frame", {
        Size = UDim2.new(0, 56, 0, 56),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 24),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = card,
    }, { corner(28), accentGradient(45) })
    label({
        Size = UDim2.new(1, 0, 1, 0),
        Text = "KEY",
        Font = Enum.Font.GothamBlack,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = logo,
    })

    label({
        Size = UDim2.new(1, 0, 0, 26),
        Position = UDim2.new(0, 0, 0, 92),
        Text = "Verification",
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })
    label({
        Size = UDim2.new(1, 0, 0, 18),
        Position = UDim2.new(0, 0, 0, 120),
        Text = "Enter your key to unlock " .. CONFIG.Title,
        TextSize = 13,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    --// Key input
    local keyBox = new("TextBox", {
        Size = UDim2.new(1, -48, 0, 42),
        Position = UDim2.new(0, 24, 0, 154),
        BackgroundColor3 = THEME.Element,
        Text = "",
        PlaceholderText = "Paste your key here...",
        PlaceholderColor3 = THEME.SubText,
        TextColor3 = THEME.Text,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        ClearTextOnFocus = false,
        Parent = card,
    }, {
        corner(8),
        stroke(THEME.Stroke, 1),
        new("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }),
    })
    local boxStroke = keyBox:FindFirstChildOfClass("UIStroke")
    keyBox.Focused:Connect(function() tween(boxStroke, 0.15, { Color = THEME.Accent }) end)
    keyBox.FocusLost:Connect(function() tween(boxStroke, 0.15, { Color = THEME.Stroke }) end)

    local status = label({
        Size = UDim2.new(1, -48, 0, 18),
        Position = UDim2.new(0, 24, 0, 202),
        Text = "",
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    --// Buttons
    local row = new("Frame", {
        Size = UDim2.new(1, -48, 0, 40),
        Position = UDim2.new(0, 24, 0, 228),
        BackgroundTransparency = 1,
        Parent = card,
    })
    local verifyBtn, verifyLabel = actionButton({
        Size = UDim2.new(0.62, -4, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Parent = row,
    }, "Verify Key", true)
    local getKeyBtn = actionButton({
        Size = UDim2.new(0.38, -4, 1, 0),
        Position = UDim2.new(0.62, 4, 0, 0),
        Parent = row,
    }, "Get Key", false)

    label({
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 1, -22),
        Text = CONFIG.ToggleKey.Name .. " to hide / show",
        TextSize = 11,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    local function setStatus(text, color)
        status.Text = text
        status.TextColor3 = color
    end

    local function shake()
        task.spawn(function()
            local origin = card.Position
            for _ = 1, 3 do
                tween(card, 0.05, { Position = origin + UDim2.new(0, 9, 0, 0) }).Completed:Wait()
                tween(card, 0.05, { Position = origin - UDim2.new(0, 9, 0, 0) }).Completed:Wait()
            end
            tween(card, 0.05, { Position = origin })
        end)
    end

    local busy = false
    local function verify()
        if busy then return end
        local input = keyBox.Text:match("^%s*(.-)%s*$")
        if input == "" then
            setStatus("Please enter a key first.", THEME.Error)
            shake()
            return
        end

        busy = true
        verifyLabel.Text = "Checking..."
        task.wait(0.5)

        if input == CONFIG.Key then
            verifyLabel.Text = "Success!"
            setStatus("Key accepted.", THEME.Success)
            saveKey(input)
            task.wait(0.5)
            tween(scale, 0.25, { Scale = 0.8 }).Completed:Wait()
            card:Destroy()
            buildMain()
        else
            verifyLabel.Text = "Verify Key"
            setStatus("Invalid key, please try again.", THEME.Error)
            tween(boxStroke, 0.2, { Color = THEME.Error })
            shake()
            task.delay(1.2, function()
                if boxStroke.Parent then tween(boxStroke, 0.3, { Color = THEME.Stroke }) end
            end)
            busy = false
        end
    end

    verifyBtn.MouseButton1Click:Connect(verify)
    keyBox.FocusLost:Connect(function(enter)
        if enter then verify() end
    end)

    getKeyBtn.MouseButton1Click:Connect(function()
        local ok = pcall(function() setclipboard(CONFIG.GetKeyLink) end)
        if ok then
            notify("Link copied", "Paste it into your browser to get a key.", 3, THEME.Success)
        else
            notify("Get your key", CONFIG.GetKeyLink, 6)
        end
    end)

    --// Auto-fill a previously saved key
    local saved = loadSavedKey()
    if saved and saved:match("^%s*(.-)%s*$") == CONFIG.Key then
        keyBox.Text = CONFIG.Key
        setStatus("Saved key found...", THEME.SubText)
        task.delay(0.7, verify)
    end
end

buildKeyScreen()--[[
    Key System + Modern Hub UI
    - Animated key screen (shake on wrong key, saves key after success)
    - Floating-panel main window with sidebar tabs, user card, minimize
    - Elements: Button, Toggle, Slider, Dropdown, Input, Info, Section
    - Toast notifications, smooth animations, Right Shift to show/hide
]]

--// ==========================
--//         CONFIG
--// ==========================
local CONFIG = {
    Key         = "DEV",
    GetKeyLink  = "https://discord.gg/hqpUbvd7y", -- copied to clipboard by "Get Key"
    Title       = "Mags",
    Version     = "v1.0",
    ToggleKey   = Enum.KeyCode.RightShift,
    SaveKey     = true,                         -- remember the key after success
    SaveFile    = "MyHub_Key.txt",
   }
local THEME = {
    Background  = Color3.fromRGB(16, 16, 22),
    Surface     = Color3.fromRGB(24, 24, 32),
    Element     = Color3.fromRGB(33, 33, 44),
    ElementHover= Color3.fromRGB(44, 44, 58),
    Stroke      = Color3.fromRGB(52, 52, 70),
    Text        = Color3.fromRGB(240, 240, 250),
    SubText     = Color3.fromRGB(150, 150, 172),
    Accent      = Color3.fromRGB(120, 90, 255),
    Accent2     = Color3.fromRGB(64, 160, 255),
    Success     = Color3.fromRGB(70, 200, 120),
    Error       = Color3.fromRGB(240, 80, 90),
}

--// ==========================
--//        SERVICES
--// ==========================
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer

--// ==========================
--//     GUI ROOT / CLEANUP
--// ==========================
local function getParent()
    local ok, result = pcall(function()
        return (gethui and gethui()) or game:GetService("CoreGui")
    end)
    if ok and result then return result end
    return LocalPlayer:WaitForChild("PlayerGui")
end

local root = getParent()
local old = root:FindFirstChild("KeySystemUI")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = root

--// Track every connection so destroying the UI cleans up fully
local connections = {}
local function connect(signal, fn)
    local c = signal:Connect(fn)
    table.insert(connections, c)
    return c
end

gui.Destroying:Connect(function()
    for _, c in ipairs(connections) do
        pcall(function() c:Disconnect() end)
    end
end)

--// ==========================
--//        HELPERS
--// ==========================
local function new(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        if k ~= "Parent" then inst[k] = v end
    end
    for _, child in ipairs(children or {}) do
        child.Parent = inst
    end
    if props and props.Parent then inst.Parent = props.Parent end
    return inst
end

local function tween(obj, time, props, style)
    local tw = TweenService:Create(
        obj,
        TweenInfo.new(time, style or Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        props
    )
    tw:Play()
    return tw
end

local function corner(r)
    return new("UICorner", { CornerRadius = UDim.new(0, r) })
end

local function stroke(color, thickness)
    return new("UIStroke", {
        Color = color,
        Thickness = thickness or 1,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    })
end

local function accentGradient(rotation)
    return new("UIGradient", {
        Color = ColorSequence.new(THEME.Accent, THEME.Accent2),
        Rotation = rotation or 0,
    })
end

local function label(props)
    local p = {
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = THEME.Text,
        TextXAlignment = Enum.TextXAlignment.Left,
    }
    for k, v in pairs(props) do p[k] = v end
    return new("TextLabel", p)
end

local function safe(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then warn("[UI] " .. tostring(err)) end
end

local orderCounter = 0
local function nextOrder()
    orderCounter += 1
    return orderCounter
end

local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragStart, startPos

    connect(handle.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local function iconButton(parent, text, pos, hoverColor, callback)
    local b = new("TextButton", {
        Size = UDim2.new(0, 26, 0, 26),
        Position = pos,
        BackgroundColor3 = THEME.Element,
        Text = text,
        TextColor3 = THEME.SubText,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        AutoButtonColor = false,
        Parent = parent,
    }, { corner(6) })

    b.MouseEnter:Connect(function()
        tween(b, 0.15, { BackgroundColor3 = hoverColor, TextColor3 = Color3.new(1, 1, 1) })
    end)
    b.MouseLeave:Connect(function()
        tween(b, 0.15, { BackgroundColor3 = THEME.Element, TextColor3 = THEME.SubText })
    end)
    b.MouseButton1Click:Connect(callback)
    return b
end

--// Big action button (primary = gradient, secondary = flat)
local function actionButton(props, text, primary)
    props.BackgroundColor3 = primary and Color3.new(1, 1, 1) or THEME.Element
    props.Text = ""
    props.AutoButtonColor = false
    local b = new("TextButton", props, { corner(8) })
    if primary then
        accentGradient(0).Parent = b
    else
        stroke(THEME.Stroke, 1).Parent = b
    end
    local l = label({
        Size = UDim2.new(1, 0, 1, 0),
        Text = text,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = b,
    })
    b.MouseEnter:Connect(function()
        if primary then
            tween(b, 0.15, { BackgroundTransparency = 0.15 })
        else
            tween(b, 0.15, { BackgroundColor3 = THEME.ElementHover })
        end
    end)
    b.MouseLeave:Connect(function()
        if primary then
            tween(b, 0.15, { BackgroundTransparency = 0 })
        else
            tween(b, 0.15, { BackgroundColor3 = THEME.Element })
        end
    end)
    return b, l
end

--// ==========================
--//    SHOW / HIDE (hotkey)
--// ==========================
local activeScale = nil
local visible = true

local function setVisible(v)
    visible = v
    if v then
        gui.Enabled = true
        if activeScale then
            activeScale.Scale = 0.9
            tween(activeScale, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
        end
    else
        if activeScale then
            tween(activeScale, 0.15, { Scale = 0.9 })
        end
        task.delay(0.15, function()
            if not visible then gui.Enabled = false end
        end)
    end
end

connect(UserInputService.InputBegan, function(input)
    if input.UserInputType ~= Enum.UserInputType.Keyboard then return end
    if input.KeyCode ~= CONFIG.ToggleKey then return end
    if UserInputService:GetFocusedTextBox() then return end
    setVisible(not visible)
end)

--// ==========================
--//     NOTIFICATIONS
--// ==========================
local notifHolder = new("Frame", {
    Name = "Notifications",
    Size = UDim2.new(0, 280, 1, -24),
    Position = UDim2.new(1, -292, 0, 12),
    BackgroundTransparency = 1,
    ZIndex = 100,
    Parent = gui,
}, {
    new("UIListLayout", {
        Padding = UDim.new(0, 8),
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }),
})

local function notify(title, text, duration, color)
    color = color or THEME.Accent
    local holder = new("Frame", {
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundTransparency = 1,
        LayoutOrder = nextOrder(),
        Parent = notifHolder,
    })
    local card = new("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(1, 40, 0, 0),
        BackgroundColor3 = THEME.Surface,
        Parent = holder,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    new("Frame", {
        Size = UDim2.new(0, 3, 1, -20),
        Position = UDim2.new(0, 8, 0, 10),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        Parent = card,
    }, { corner(2) })

    label({
        Size = UDim2.new(1, -34, 0, 18),
        Position = UDim2.new(0, 22, 0, 8),
        Text = title,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        Parent = card,
    })
    label({
        Size = UDim2.new(1, -34, 0, 28),
        Position = UDim2.new(0, 22, 0, 26),
        Text = text,
        TextSize = 12,
        TextColor3 = THEME.SubText,
        TextWrapped = true,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = card,
    })

    tween(card, 0.4, { Position = UDim2.new(0, 0, 0, 0) }, Enum.EasingStyle.Back)

    task.delay(duration or 3, function()
        if not card.Parent then return end
        local tw = tween(card, 0.25, { Position = UDim2.new(1, 40, 0, 0) })
        tw.Completed:Wait()
        if holder.Parent then holder:Destroy() end
    end)
end

--// ==========================
--//     UI ELEMENT BUILDERS
--// ==========================
local function baseRow(page, height)
    return new("Frame", {
        Size = UDim2.new(1, 0, 0, height or 38),
        BackgroundColor3 = THEME.Element,
        BorderSizePixel = 0,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })
end

local function addSection(page, text)
    label({
        Size = UDim2.new(1, 0, 0, 22),
        Text = string.upper(text),
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        TextColor3 = THEME.SubText,
        LayoutOrder = nextOrder(),
        Parent = page,
    })
end

local function addInfo(page, key, value)
    local row = baseRow(page, 34)
    label({
        Size = UDim2.new(0.4, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = key,
        TextColor3 = THEME.SubText,
        TextSize = 13,
        Parent = row,
    })
    return label({
        Size = UDim2.new(0.6, -14, 1, 0),
        Position = UDim2.new(0.4, 0, 0, 0),
        Text = tostring(value),
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = row,
    })
end

local function addButton(page, text, callback)
    local row = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    label({
        Size = UDim2.new(1, -44, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    label({
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        Text = ">",
        Font = Enum.Font.GothamBold,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = row,
    })

    row.MouseEnter:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.ElementHover }) end)
    row.MouseLeave:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.Element }) end)
    row.MouseButton1Click:Connect(function() safe(callback) end)
end

local function addToggle(page, text, default, callback)
    local state = default or false
    local row = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    label({
        Size = UDim2.new(1, -70, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })

    local track = new("Frame", {
        Size = UDim2.new(0, 40, 0, 20),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -12, 0.5, 0),
        BackgroundColor3 = state and THEME.Accent or THEME.Stroke,
        Parent = row,
    }, { corner(10) })

    local knob = new("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = state and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = track,
    }, { corner(7) })

    local function set(v, silent)
        state = v
        tween(track, 0.2, { BackgroundColor3 = v and THEME.Accent or THEME.Stroke })
        tween(knob, 0.2, { Position = v and UDim2.new(1, -17, 0.5, 0) or UDim2.new(0, 3, 0.5, 0) })
        if not silent then safe(callback, v) end
    end

    row.MouseEnter:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.ElementHover }) end)
    row.MouseLeave:Connect(function() tween(row, 0.15, { BackgroundColor3 = THEME.Element }) end)
    row.MouseButton1Click:Connect(function() set(not state) end)

    return { Set = function(v) set(v, true) end }
end

local function addSlider(page, text, min, max, default, callback)
    local value = math.clamp(default or min, min, max)
    local row = baseRow(page, 54)

    label({
        Size = UDim2.new(1, -80, 0, 30),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    local valueLabel = label({
        Size = UDim2.new(0, 60, 0, 30),
        Position = UDim2.new(1, -74, 0, 0),
        Text = tostring(value),
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = row,
    })

    local track = new("Frame", {
        Size = UDim2.new(1, -28, 0, 6),
        Position = UDim2.new(0, 14, 0, 37),
        BackgroundColor3 = THEME.Stroke,
        Parent = row,
    }, { corner(3) })

    local fill = new("Frame", {
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = track,
    }, { corner(3), accentGradient(0) })

    new("Frame", {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = fill,
    }, { corner(7) })

    --// Bigger invisible hitbox so it's easy to grab
    local hit = new("TextButton", {
        Size = UDim2.new(1, -28, 0, 24),
        Position = UDim2.new(0, 14, 0, 28),
        BackgroundTransparency = 1,
        Text = "",
        Parent = row,
    })

    local dragging = false
    local function setFromX(x)
        local a = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
        local newValue = math.floor(min + (max - min) * a + 0.5)
        if newValue == value then return end
        value = newValue
        valueLabel.Text = tostring(value)
        fill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
        safe(callback, value)
    end

    hit.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            setFromX(input.Position.X)
        end
    end)
    connect(UserInputService.InputChanged, function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) then
            setFromX(input.Position.X)
        end
    end)
    connect(UserInputService.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

local function addDropdown(page, text, options, default, callback)
    local selected = default or options[1]
    local open = false

    local frame = new("Frame", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = THEME.Element,
        ClipsDescendants = true,
        LayoutOrder = nextOrder(),
        Parent = page,
    }, { corner(8), stroke(THEME.Stroke, 1) })

    local header = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundTransparency = 1,
        Text = "",
        Parent = frame,
    })
    label({
        Size = UDim2.new(0.5, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = header,
    })
    local selectedLabel = label({
        Size = UDim2.new(0.5, -40, 1, 0),
        Position = UDim2.new(0.5, 0, 0, 0),
        Text = selected,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Right,
        Parent = header,
    })
    local arrow = label({
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        Text = "v",
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = header,
    })

    local optionButtons = {}
    local function refresh()
        for opt, btn in pairs(optionButtons) do
            btn.TextColor3 = (opt == selected) and THEME.Accent2 or THEME.SubText
        end
        selectedLabel.Text = selected
    end

    local function setOpen(v)
        open = v
        tween(frame, 0.25, { Size = UDim2.new(1, 0, 0, v and (38 + #options * 30 + 8) or 38) })
        tween(arrow, 0.25, { Rotation = v and 180 or 0 })
    end

    for i, opt in ipairs(options) do
        local ob = new("TextButton", {
            Size = UDim2.new(1, -12, 0, 26),
            Position = UDim2.new(0, 6, 0, 40 + (i - 1) * 30),
            BackgroundColor3 = THEME.Background,
            Text = opt,
            TextColor3 = THEME.SubText,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            AutoButtonColor = false,
            Parent = frame,
        }, { corner(6) })
        optionButtons[opt] = ob
        ob.MouseButton1Click:Connect(function()
            selected = opt
            refresh()
            setOpen(false)
            safe(callback, opt)
        end)
    end

    header.MouseButton1Click:Connect(function() setOpen(not open) end)
    refresh()
end

local function addInput(page, text, placeholder, callback)
    local row = baseRow(page, 38)
    label({
        Size = UDim2.new(0.5, -14, 1, 0),
        Position = UDim2.new(0, 14, 0, 0),
        Text = text,
        Parent = row,
    })
    local box = new("TextBox", {
        Size = UDim2.new(0.5, -20, 0, 26),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -8, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        Text = "",
        PlaceholderText = placeholder or "",
        PlaceholderColor3 = THEME.SubText,
        TextColor3 = THEME.Text,
        Font = Enum.Font.Gotham,
        TextSize = 13,
        ClearTextOnFocus = false,
        Parent = row,
    }, { corner(6), stroke(THEME.Stroke, 1) })

    local s = box:FindFirstChildOfClass("UIStroke")
    box.Focused:Connect(function() tween(s, 0.15, { Color = THEME.Accent }) end)
    box.FocusLost:Connect(function(enter)
        tween(s, 0.15, { Color = THEME.Stroke })
        if enter then safe(callback, box.Text) end
    end)
end

--// ==========================
--//    KEY SAVE / LOAD
--// ==========================
local function loadSavedKey()
    if not CONFIG.SaveKey then return nil end
    local ok, result = pcall(function()
        if isfile and readfile and isfile(CONFIG.SaveFile) then
            return readfile(CONFIG.SaveFile)
        end
    end)
    return ok and result or nil
end

local function saveKey(k)
    if CONFIG.SaveKey and writefile then
        pcall(writefile, CONFIG.SaveFile, k)
    end
end

--// ==========================
--//        MAIN WINDOW
--// ==========================
local function buildMain()
    local W, H = 640, 420

    local main = new("Frame", {
        Name = "Main",
        Size = UDim2.new(0, W, 0, H),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        ClipsDescendants = true,
        Parent = gui,
    }, { corner(14), stroke(THEME.Stroke, 1) })

    local scale = new("UIScale", { Parent = main })
    activeScale = scale
    scale.Scale = 0.85
    tween(scale, 0.4, { Scale = 1 }, Enum.EasingStyle.Back)

    --// Top bar
    local topbar = new("Frame", {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundTransparency = 1,
        Active = true,
        Parent = main,
    })
    makeDraggable(main, topbar)

    new("Frame", {
        Size = UDim2.new(0, 22, 0, 22),
        Position = UDim2.new(0, 14, 0, 12),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = topbar,
    }, { corner(6), accentGradient(45) })

    label({
        Size = UDim2.new(1, -160, 1, 0),
        Position = UDim2.new(0, 46, 0, 0),
        Text = CONFIG.Title .. '  <font color="rgb(150,150,172)" size="12">' .. CONFIG.Version .. "</font>",
        RichText = true,
        Font = Enum.Font.GothamBold,
        TextSize = 15,
        Parent = topbar,
    })

    local minimized = false
    iconButton(topbar, "-", UDim2.new(1, -72, 0, 10), THEME.ElementHover, function()
        minimized = not minimized
        local shift = (H - 46) / 2
        tween(main, 0.3, {
            Size = UDim2.new(0, W, 0, minimized and 46 or H),
            Position = main.Position + UDim2.new(0, 0, 0, minimized and -shift or shift),
        })
    end)
    iconButton(topbar, "X", UDim2.new(1, -40, 0, 10), THEME.Error, function()
        gui:Destroy()
    end)

    --// Sidebar
    local sidebar = new("Frame", {
        Size = UDim2.new(0, 150, 1, -60),
        Position = UDim2.new(0, 10, 0, 50),
        BackgroundColor3 = THEME.Surface,
        Parent = main,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    local tabHolder = new("Frame", {
        Size = UDim2.new(1, -16, 1, -76),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundTransparency = 1,
        Parent = sidebar,
    }, {
        new("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder }),
    })

    --// User card (bottom of sidebar)
    local userCard = new("Frame", {
        Size = UDim2.new(1, -16, 0, 50),
        Position = UDim2.new(0, 8, 1, -58),
        BackgroundColor3 = THEME.Element,
        Parent = sidebar,
    }, { corner(8) })

    local avatar = new("ImageLabel", {
        Size = UDim2.new(0, 34, 0, 34),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundColor3 = THEME.Background,
        Image = "",
        Parent = userCard,
    }, { corner(17) })

    task.spawn(function()
        local ok, img = pcall(function()
            return Players:GetUserThumbnailAsync(
                LocalPlayer.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
        end)
        if ok and avatar.Parent then avatar.Image = img end
    end)

    label({
        Size = UDim2.new(1, -52, 0, 16),
        Position = UDim2.new(0, 48, 0, 9),
        Text = LocalPlayer.DisplayName,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = userCard,
    })
    label({
        Size = UDim2.new(1, -52, 0, 14),
        Position = UDim2.new(0, 48, 0, 26),
        Text = "@" .. LocalPlayer.Name,
        TextSize = 11,
        TextColor3 = THEME.SubText,
        TextTruncate = Enum.TextTruncate.AtEnd,
        Parent = userCard,
    })

    --// Content panel
    local content = new("Frame", {
        Size = UDim2.new(1, -178, 1, -60),
        Position = UDim2.new(0, 168, 0, 50),
        BackgroundColor3 = THEME.Surface,
        Parent = main,
    }, { corner(10), stroke(THEME.Stroke, 1) })

    local header = label({
        Size = UDim2.new(1, -28, 0, 34),
        Position = UDim2.new(0, 14, 0, 4),
        Text = "",
        Font = Enum.Font.GothamBold,
        TextSize = 17,
        Parent = content,
    })

    --// Tabs
    local tabs = {}
    local selectedTab = nil

    local function selectTab(name)
        selectedTab = name
        for n, t in pairs(tabs) do
            local on = (n == name)
            t.page.Visible = on
            tween(t.button, 0.2, { BackgroundTransparency = on and 0 or 1 })
            tween(t.indicator, 0.2, {
                BackgroundTransparency = on and 0 or 1,
                Size = UDim2.new(0, 3, 0, on and 16 or 0),
            })
            tween(t.text, 0.2, { TextColor3 = on and THEME.Text or THEME.SubText })
        end
        header.Text = name
    end

    local function createTab(name, icon)
        local button = new("TextButton", {
            Size = UDim2.new(1, 0, 0, 36),
            BackgroundColor3 = THEME.Element,
            BackgroundTransparency = 1,
            Text = "",
            AutoButtonColor = false,
            LayoutOrder = nextOrder(),
            Parent = tabHolder,
        }, { corner(8) })

        local indicator = new("Frame", {
            Size = UDim2.new(0, 3, 0, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 4, 0.5, 0),
            BackgroundColor3 = THEME.Accent,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Parent = button,
        }, { corner(2) })

        local text = label({
            Size = UDim2.new(1, -20, 1, 0),
            Position = UDim2.new(0, 18, 0, 0),
            Text = (icon and (icon .. "  ") or "") .. name,
            TextColor3 = THEME.SubText,
            Font = Enum.Font.GothamMedium,
            Parent = button,
        })

        local page = new("ScrollingFrame", {
            Name = name,
            Size = UDim2.new(1, -16, 1, -46),
            Position = UDim2.new(0, 8, 0, 40),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 3,
            ScrollBarImageColor3 = THEME.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
            Parent = content,
        }, {
            new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }),
            new("UIPadding", { PaddingRight = UDim.new(0, 8), PaddingBottom = UDim.new(0, 4) }),
        })

        button.MouseEnter:Connect(function()
            if selectedTab ~= name then tween(button, 0.15, { BackgroundTransparency = 0.5 }) end
        end)
        button.MouseLeave:Connect(function()
            if selectedTab ~= name then tween(button, 0.15, { BackgroundTransparency = 1 }) end
        end)
        button.MouseButton1Click:Connect(function() selectTab(name) end)

        tabs[name] = { page = page, button = button, indicator = indicator, text = text }
        return page
    end

    --// ============ YOUR TABS ============
    local function getHumanoid()
        local c = LocalPlayer.Character
        return c and c:FindFirstChildOfClass("Humanoid")
    end

    -- HOME
    local home = createTab("Home", "H")
    local hero = new("Frame", {
        Size = UDim2.new(1, 0, 0, 78),
        BackgroundColor3 = Color3.new(1, 1, 1),
        LayoutOrder = nextOrder(),
        Parent = home,
    }, { corner(10), accentGradient(25) })
    label({
        Size = UDim2.new(1, -32, 0, 24),
        Position = UDim2.new(0, 16, 0, 14),
        Text = "Welcome, " .. LocalPlayer.DisplayName,
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        Parent = hero,
    })
    label({
        Size = UDim2.new(1, -32, 0, 20),
        Position = UDim2.new(0, 16, 0, 44),
        Text = "Press " .. CONFIG.ToggleKey.Name .. " to show or hide this menu",
        TextSize = 12,
        TextColor3 = Color3.fromRGB(235, 235, 255),
        Parent = hero,
    })

    local gameName = "Unknown"
    pcall(function()
        gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
    end)
    addSection(home, "Game")
    addInfo(home, "Name", gameName)
    addInfo(home, "Place ID", game.PlaceId)
    addInfo(home, "Players", #Players:GetPlayers() .. " / " .. Players.MaxPlayers)

    -- PLAYER
    local plr = createTab("Player", "P")
    addSection(plr, "Movement")
    local hum = getHumanoid()
    addSlider(plr, "Walk Speed", 16, 200, hum and math.floor(hum.WalkSpeed) or 16, function(v)
        local h = getHumanoid()
        if h then h.WalkSpeed = v end
    end)
    addSlider(plr, "Jump Power", 50, 300, 50, function(v)
        local h = getHumanoid()
        if h then
            h.UseJumpPower = true
            h.JumpPower = v
        end
    end)

    local jumpConn
    addToggle(plr, "Infinite Jump", false, function(on)
        if on then
            jumpConn = connect(UserInputService.JumpRequest, function()
                local h = getHumanoid()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        elseif jumpConn then
            jumpConn:Disconnect()
            jumpConn = nil
        end
    end)

    addSection(plr, "Character")
    addButton(plr, "Reset Character", function()
        local h = getHumanoid()
        if h then h.Health = 0 end
    end)

    -- SCRIPTS
    local scripts = createTab("Scripts", "R")

    local function getRoot()
        local c = LocalPlayer.Character
        return c and c:FindFirstChild("HumanoidRootPart")
    end

    ---------- FLY ----------
    addSection(scripts, "Fly  (WASD, Space = up, Ctrl = down)")

    local flySpeed = 60
    local bodyVel, bodyGyro, flyConn
    local flyToggle

    local function stopFly()
        if flyConn then flyConn:Disconnect() flyConn = nil end
        if bodyVel then bodyVel:Destroy() bodyVel = nil end
        if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
        local h = getHumanoid()
        if h then h.PlatformStand = false end
    end

    local function startFly()
        local hrp = getRoot()
        local h = getHumanoid()
        if not hrp or not h then
            notify("Fly failed", "Character not found.", 3, THEME.Error)
            return false
        end

        stopFly()
        h.PlatformStand = true

        bodyVel = Instance.new("BodyVelocity")
        bodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bodyVel.Velocity = Vector3.new(0, 0, 0)
        bodyVel.Parent = hrp

        bodyGyro = Instance.new("BodyGyro")
        bodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bodyGyro.P = 9e4
        bodyGyro.CFrame = hrp.CFrame
        bodyGyro.Parent = hrp

        flyConn = connect(RunService.RenderStepped, function()
            local cam = workspace.CurrentCamera
            if not cam or not hrp.Parent then
                stopFly()
                if flyToggle then flyToggle.Set(false) end
                return
            end

            local dir = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end

            bodyVel.Velocity = dir.Magnitude > 0 and dir.Unit * flySpeed or Vector3.new(0, 0, 0)
            bodyGyro.CFrame = cam.CFrame
        end)
        return true
    end

    flyToggle = addToggle(scripts, "Fly", false, function(on)
        if on then
            if not startFly() then flyToggle.Set(false) end
        else
            stopFly()
        end
    end)
    addSlider(scripts, "Fly Speed", 10, 300, flySpeed, function(v) flySpeed = v end)

    gui.Destroying:Connect(stopFly)

    ---------- NOCLIP ----------
    addSection(scripts, "Movement")
    local noclipConn
    addToggle(scripts, "Noclip", false, function(on)
        if on then
            noclipConn = connect(RunService.Stepped, function()
                local c = LocalPlayer.Character
                if not c then return end
                for _, p in ipairs(c:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide = false end
                end
            end)
        elseif noclipConn then
            noclipConn:Disconnect()
            noclipConn = nil
        end
    end)

    ---------- TELEPORT ----------
    addSection(scripts, "Teleport")

    local function findPlayer(query)
        query = query:lower()
        if query == "" then return nil end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer
                and (p.Name:lower():sub(1, #query) == query
                or p.DisplayName:lower():sub(1, #query) == query) then
                return p
            end
        end
    end

    addInput(scripts, "To Player", "name + Enter", function(text)
        local target = findPlayer(text)
        local hrp = getRoot()
        local targetRoot = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if hrp and targetRoot then
            hrp.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
            notify("Teleported", "Now near " .. target.DisplayName, 2, THEME.Success)
        else
            notify("Teleport failed", "Player not found.", 3, THEME.Error)
        end
    end)

    addInput(scripts, "To Coords", "x, y, z + Enter", function(text)
        local x, y, z = text:match("^%s*(-?[%d%.]+)[,%s]+(-?[%d%.]+)[,%s]+(-?[%d%.]+)%s*$")
        x, y, z = tonumber(x), tonumber(y), tonumber(z)
        local hrp = getRoot()
        if hrp and x and y and z then
            hrp.CFrame = CFrame.new(x, y, z)
            notify("Teleported", string.format("%d, %d, %d", x, y, z), 2, THEME.Success)
        else
            notify("Teleport failed", "Use the format: 100, 50, -20", 3, THEME.Error)
        end
    end)

    local savedCFrame
    addButton(scripts, "Save Position", function()
        local hrp = getRoot()
        if hrp then
            savedCFrame = hrp.CFrame
            notify("Position saved", "Use 'Teleport to Saved' to return.", 2, THEME.Success)
        end
    end)
    addButton(scripts, "Teleport to Saved", function()
        local hrp = getRoot()
        if hrp and savedCFrame then
            hrp.CFrame = savedCFrame
        else
            notify("No saved position", "Press 'Save Position' first.", 3, THEME.Error)
        end
    end)
    addButton(scripts, "Copy Current Position", function()
        local hrp = getRoot()
        if not hrp then return end
        local p = hrp.Position
        local str = string.format("%d, %d, %d", p.X, p.Y, p.Z)
        local ok = pcall(function() setclipboard(str) end)
        notify(ok and "Copied" or "Position", str, 3)
    end)

    local clickTp = false
    local mouse = LocalPlayer:GetMouse()
    addToggle(scripts, "Ctrl + Click Teleport", false, function(on) clickTp = on end)
    connect(UserInputService.InputBegan, function(input, processed)
        if not clickTp or processed then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1
            and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            local hrp = getRoot()
            if hrp and mouse.Hit then
                hrp.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
            end
        end
    end)

    ---------- EXTERNAL HUBS ----------
    addSection(scripts, "External Scripts")

    local hubKey = CONFIG.HubKey
    addInput(scripts, "Hub Key", "optional + Enter", function(text)
        hubKey = text
        notify("Hub key set", text ~= "" and "Key will be used on load." or "Key cleared.", 2)
    end)
    addButton(scripts, "Load Jager Hub", function()
        if hubKey ~= "" then
            (getgenv and getgenv() or _G).script_key = hubKey
        end
        notify("Loading...", "Fetching the Jager Hub loader.", 3)
        local ok, err = pcall(function()
            loadstring(game:HttpGet(CONFIG.HubURL))()
        end)
        if not ok then
            notify("Load failed", tostring(err), 5, THEME.Error)
        end
    end)

    -- FOOTBALL
    local fb = createTab("Football", "F")

    ---------- BALL (Mag) ----------
    addSection(fb, "Ball")

    local magOn, ballEspOn = false, false
    local magRange = 25
    local ballName = ""           -- leave empty = auto-detect ("Football" / "Ball")
    local ballCache = {}
    local lastScan = 0

    local ballFolder = Instance.new("Folder")
    ballFolder.Name = "BallESP"
    ballFolder.Parent = gui

    local function isBall(part)
        if not part:IsA("BasePart") then return false end
        local n = part.Name:lower()

        --// A name picked/typed by the user is trusted, no other filters
        if ballName ~= "" then return n == ballName:lower() end

        --// Auto-detect: name must look like a ball...
        if not (n:find("football", 1, true) or n == "ball") then return false end
        --// ...and it can't be a fixed decoration (statues, field logos)
        if part.Anchored then return false end
        local s = part.Size
        if math.max(s.X, s.Y, s.Z) > 6 then return false end
        return true
    end

    local function scanBalls()
        ballCache = {}
        ballFolder:ClearAllChildren()
        for _, d in ipairs(workspace:GetDescendants()) do
            if isBall(d) then
                --// ignore parts that belong to a player's character
                local m = d:FindFirstAncestorOfClass("Model")
                if not (m and m:FindFirstChildOfClass("Humanoid")) then
                    table.insert(ballCache, d)
                    if ballEspOn then
                        new("Highlight", {
                            Adornee = d,
                            FillColor = Color3.fromRGB(255, 200, 60),
                            FillTransparency = 0.3,
                            OutlineColor = Color3.new(1, 1, 1),
                            Parent = ballFolder,
                        })
                    end
                end
            end
        end
    end

    connect(RunService.Heartbeat, function()
        if not (magOn or ballEspOn) then return end

        local now = os.clock()
        if now - lastScan > 2 then
            lastScan = now
            scanBalls()
        end

        if not magOn or not firetouchinterest then return end
        local hrp = getRoot()
        if not hrp then return end

        --// Touch with the root part AND hands/arms (catches often check those)
        local touchers = { hrp }
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetChildren()) do
                if p:IsA("BasePart") and (p.Name:find("Hand") or p.Name:find("Arm")) then
                    table.insert(touchers, p)
                end
            end
        end

        for _, ball in ipairs(ballCache) do
            if ball.Parent and (ball.Position - hrp.Position).Magnitude <= magRange then
                for _, part in ipairs(touchers) do
                    firetouchinterest(part, ball, 0)
                    firetouchinterest(part, ball, 1)
                end
            end
        end
    end)

    addToggle(fb, "Mag (auto-touch ball in range)", false, function(on)
        magOn = on
        lastScan = 0
        if on and not firetouchinterest then
            notify("Not supported", "Your executor has no firetouchinterest.", 4, THEME.Error)
        end
    end)
    addSlider(fb, "Mag Range", 5, 60, magRange, function(v) magRange = v end)

    addToggle(fb, "Ball ESP", false, function(on)
        ballEspOn = on
        lastScan = 0
        if not on then ballFolder:ClearAllChildren() end
    end)

    addInput(fb, "Ball Name", "default: auto", function(text)
        ballName = text
        lastScan = 0
        notify("Ball name set", text ~= "" and text or "Auto-detect", 2)
    end)

    --// Click-to-pick: click the real ball in the world to lock onto its name
    local picking = false
    local pickMouse = LocalPlayer:GetMouse()
    addButton(fb, "Pick Ball (then click the ball)", function()
        picking = true
        notify("Pick mode", "Click the football in the world.", 4)
    end)
    connect(UserInputService.InputBegan, function(input, processed)
        if not picking or processed then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        local target = pickMouse.Target
        if not target then return end
        picking = false
        ballName = target.Name
        lastScan = 0
        notify("Ball set: " .. target.Name, string.format(
            "Anchored: %s  Size: %d x %d x %d",
            tostring(target.Anchored), target.Size.X, target.Size.Y, target.Size.Z
        ), 5, THEME.Success)
        print("[Ball] picked:", target:GetFullName())
    end)

    addButton(fb, "Ball Info (prints to F9 console)", function()
        scanBalls()
        notify("Ball scan", #ballCache .. " ball(s) found. Check the F9 console.", 4)
        for _, b in ipairs(ballCache) do
            print("[Ball]", b:GetFullName(), "Anchored:", b.Anchored, "Size:", b.Size)
        end
    end)

    addButton(fb, "Teleport to Ball", function()
        scanBalls()
        local hrp = getRoot()
        if not hrp then return end
        local nearest, best = nil, math.huge
        for _, ball in ipairs(ballCache) do
            local d = (ball.Position - hrp.Position).Magnitude
            if d < best then nearest, best = ball, d end
        end
        if nearest then
            hrp.CFrame = nearest.CFrame + Vector3.new(0, 4, 0)
        else
            notify("No ball found", "Try setting the Ball Name above.", 3, THEME.Error)
        end
    end)

    ---------- ESP ----------
    addSection(fb, "Players")

    local espOn = false
    local espFolder = Instance.new("Folder")
    espFolder.Name = "PlayerESP"
    espFolder.Parent = gui

    local function applyESP(p)
        if p == LocalPlayer then return end
        local existing = espFolder:FindFirstChild(p.Name)
        if existing then existing:Destroy() end
        if not espOn or not p.Character then return end
        new("Highlight", {
            Name = p.Name,
            Adornee = p.Character,
            FillColor = (p.Team and p.Team.TeamColor.Color) or THEME.Accent,
            FillTransparency = 0.6,
            OutlineColor = Color3.new(1, 1, 1),
            Parent = espFolder,
        })
    end

    local function watchPlayer(p)
        connect(p.CharacterAdded, function()
            task.wait(0.5)
            applyESP(p)
        end)
    end
    for _, p in ipairs(Players:GetPlayers()) do watchPlayer(p) end
    connect(Players.PlayerAdded, watchPlayer)
    connect(Players.PlayerRemoving, function(p)
        local h = espFolder:FindFirstChild(p.Name)
        if h then h:Destroy() end
    end)

    addToggle(fb, "Player ESP (team colors)", false, function(on)
        espOn = on
        for _, p in ipairs(Players:GetPlayers()) do applyESP(p) end
    end)

    ---------- MISC ----------
    addSection(fb, "Misc")

    local cam = workspace.CurrentCamera
    addSlider(fb, "Field of View", 40, 120, cam and math.floor(cam.FieldOfView) or 70, function(v)
        local c = workspace.CurrentCamera
        if c then c.FieldOfView = v end
    end)

    local afkConn
    addToggle(fb, "Anti-AFK", false, function(on)
        if on then
            afkConn = connect(LocalPlayer.Idled, function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        elseif afkConn then
            afkConn:Disconnect()
            afkConn = nil
        end
    end)

    -- SETTINGS
    local settings = createTab("Settings", "S")
    addSection(settings, "Interface")
    addDropdown(settings, "Notification Style", { "Info", "Success", "Error" }, "Info", function(opt)
        notify("Style changed", "Selected: " .. opt, 2)
    end)
    addInput(settings, "Send Message", "Type + Enter", function(text)
        if text ~= "" then notify("Message", text, 3) end
    end)
    addToggle(settings, "Show Welcome Toasts", true, function(on)
        notify("Setting saved", "Welcome toasts " .. (on and "enabled" or "disabled"), 2, THEME.Success)
    end)
    addSection(settings, "Danger Zone")
    addButton(settings, "Destroy UI", function() gui:Destroy() end)
    --// ===================================

    selectTab("Home")
    notify("Welcome!", "Loaded successfully. Press " .. CONFIG.ToggleKey.Name .. " to hide.", 4, THEME.Success)
end

--// ==========================
--//        KEY SCREEN
--// ==========================
local function buildKeyScreen()
    local card = new("Frame", {
        Name = "KeyCard",
        Size = UDim2.new(0, 400, 0, 306),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        BackgroundColor3 = THEME.Background,
        Parent = gui,
    }, { corner(14), stroke(THEME.Stroke, 1) })

    local scale = new("UIScale", { Parent = card })
    activeScale = scale
    scale.Scale = 0.85
    tween(scale, 0.4, { Scale = 1 }, Enum.EasingStyle.Back)
    makeDraggable(card)

    --// Accent bar
    new("Frame", {
        Size = UDim2.new(1, -40, 0, 3),
        Position = UDim2.new(0, 20, 0, 0),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        Parent = card,
    }, { corner(2), accentGradient(0) })

    iconButton(card, "X", UDim2.new(1, -38, 0, 12), THEME.Error, function()
        gui:Destroy()
    end)

    --// Logo
    local logo = new("Frame", {
        Size = UDim2.new(0, 56, 0, 56),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 24),
        BackgroundColor3 = Color3.new(1, 1, 1),
        Parent = card,
    }, { corner(28), accentGradient(45) })
    label({
        Size = UDim2.new(1, 0, 1, 0),
        Text = "KEY",
        Font = Enum.Font.GothamBlack,
        TextSize = 14,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = logo,
    })

    label({
        Size = UDim2.new(1, 0, 0, 26),
        Position = UDim2.new(0, 0, 0, 92),
        Text = "Verification",
        Font = Enum.Font.GothamBold,
        TextSize = 20,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })
    label({
        Size = UDim2.new(1, 0, 0, 18),
        Position = UDim2.new(0, 0, 0, 120),
        Text = "Enter your key to unlock " .. CONFIG.Title,
        TextSize = 13,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    --// Key input
    local keyBox = new("TextBox", {
        Size = UDim2.new(1, -48, 0, 42),
        Position = UDim2.new(0, 24, 0, 154),
        BackgroundColor3 = THEME.Element,
        Text = "",
        PlaceholderText = "Paste your key here...",
        PlaceholderColor3 = THEME.SubText,
        TextColor3 = THEME.Text,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        ClearTextOnFocus = false,
        Parent = card,
    }, {
        corner(8),
        stroke(THEME.Stroke, 1),
        new("UIPadding", { PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }),
    })
    local boxStroke = keyBox:FindFirstChildOfClass("UIStroke")
    keyBox.Focused:Connect(function() tween(boxStroke, 0.15, { Color = THEME.Accent }) end)
    keyBox.FocusLost:Connect(function() tween(boxStroke, 0.15, { Color = THEME.Stroke }) end)

    local status = label({
        Size = UDim2.new(1, -48, 0, 18),
        Position = UDim2.new(0, 24, 0, 202),
        Text = "",
        TextSize = 12,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    --// Buttons
    local row = new("Frame", {
        Size = UDim2.new(1, -48, 0, 40),
        Position = UDim2.new(0, 24, 0, 228),
        BackgroundTransparency = 1,
        Parent = card,
    })
    local verifyBtn, verifyLabel = actionButton({
        Size = UDim2.new(0.62, -4, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Parent = row,
    }, "Verify Key", true)
    local getKeyBtn = actionButton({
        Size = UDim2.new(0.38, -4, 1, 0),
        Position = UDim2.new(0.62, 4, 0, 0),
        Parent = row,
    }, "Get Key", false)

    label({
        Size = UDim2.new(1, 0, 0, 14),
        Position = UDim2.new(0, 0, 1, -22),
        Text = CONFIG.ToggleKey.Name .. " to hide / show",
        TextSize = 11,
        TextColor3 = THEME.SubText,
        TextXAlignment = Enum.TextXAlignment.Center,
        Parent = card,
    })

    local function setStatus(text, color)
        status.Text = text
        status.TextColor3 = color
    end

    local function shake()
        task.spawn(function()
            local origin = card.Position
            for _ = 1, 3 do
                tween(card, 0.05, { Position = origin + UDim2.new(0, 9, 0, 0) }).Completed:Wait()
                tween(card, 0.05, { Position = origin - UDim2.new(0, 9, 0, 0) }).Completed:Wait()
            end
            tween(card, 0.05, { Position = origin })
        end)
    end

    local busy = false
    local function verify()
        if busy then return end
        local input = keyBox.Text:match("^%s*(.-)%s*$")
        if input == "" then
            setStatus("Please enter a key first.", THEME.Error)
            shake()
            return
        end

        busy = true
        verifyLabel.Text = "Checking..."
        task.wait(0.5)

        if input == CONFIG.Key then
            verifyLabel.Text = "Success!"
            setStatus("Key accepted.", THEME.Success)
            saveKey(input)
            task.wait(0.5)
            tween(scale, 0.25, { Scale = 0.8 }).Completed:Wait()
            card:Destroy()
            buildMain()
        else
            verifyLabel.Text = "Verify Key"
            setStatus("Invalid key, please try again.", THEME.Error)
            tween(boxStroke, 0.2, { Color = THEME.Error })
            shake()
            task.delay(1.2, function()
                if boxStroke.Parent then tween(boxStroke, 0.3, { Color = THEME.Stroke }) end
            end)
            busy = false
        end
    end

    verifyBtn.MouseButton1Click:Connect(verify)
    keyBox.FocusLost:Connect(function(enter)
        if enter then verify() end
    end)

    getKeyBtn.MouseButton1Click:Connect(function()
        local ok = pcall(function() setclipboard(CONFIG.GetKeyLink) end)
        if ok then
            notify("Link copied", "Paste it into your browser to get a key.", 3, THEME.Success)
        else
            notify("Get your key", CONFIG.GetKeyLink, 6)
        end
    end)

    --// Auto-fill a previously saved key
    local saved = loadSavedKey()
    if saved and saved:match("^%s*(.-)%s*$") == CONFIG.Key then
        keyBox.Text = CONFIG.Key
        setStatus("Saved key found...", THEME.SubText)
        task.delay(0.7, verify)
    end
end

buildKeyScreen()
