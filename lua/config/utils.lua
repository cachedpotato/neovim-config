M = {}
-- set linehl hl group
function M.create_hl_group(severity)
    -- get color codes for Err / Warn / Info / Hint
    -- Dim the colors
    -- return the colors to use as line highlights
    local col = vim.api.nvim_get_hl(0, { name = "Diagnostic" .. severity }).fg

    -- color encoding: r * (256 * 256) + g * 256 + b (hex)
    --rgb split
    local r = math.floor(col / (256 * 256))
    local g = math.floor(col / 256) % 256
    local b = math.floor(col % 256)

    local h, s, l = M.rgb_to_hsl(r, g, b)

    --dimming
    --hue remains the same
    local new_h = h
    local new_s = s / 6
    local new_l = l / 3

    r, g, b = M.hsl_to_rgb(new_h, new_s, new_l)
    local dec = math.floor(r * (256 * 256) + g * 256 + b)

    --back to decimal to store as group
    vim.api.nvim_set_hl(0, 'Diagnostic' .. severity .. 'Ln', { bg = dec })
end

-- http://axonflux.com/handy-rgb-to-hsl-and-rgb-to-hsv-color-model-c
--[[
 * Converts an RGB color value to HSL. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and l in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSL representation
]]

function M.rgb_to_hsl(r, g, b)
    r, g, b = r / 255, g / 255, b / 255

    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, l

    l = (max + min) / 2

    if max == min then
        h, s = 0, 0 -- achromatic
    else
        local d = max - min
        if l > 0.5 then s = d / (2 - max - min) else s = d / (max + min) end
        if max == r then
            h = (g - b) / d
            if g < b then h = h + 6 end
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end

    return h, s, l or 255
end

--[[
 * Converts an HSL color value to RGB. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
 * Assumes h, s, and l are contained in the set [0, 1] and
 * returns r, g, and b in the set [0, 255].
 *
 * @param   Number  h       The hue
 * @param   Number  s       The saturation
 * @param   Number  l       The lightness
 * @return  Array           The RGB representation
]]
function M.hsl_to_rgb(h, s, l)
    local r, g, b

    if s == 0 then
        r, g, b = l, l, l -- achromatic
    else
        local function hue2rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1 / 6 then return p + (q - p) * 6 * t end
            if t < 1 / 2 then return q end
            if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
            return p
        end

        local q
        if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
        local p = 2 * l - q

        r = hue2rgb(p, q, h + 1 / 3)
        g = hue2rgb(p, q, h)
        b = hue2rgb(p, q, h - 1 / 3)
    end

    return math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
end

return M
