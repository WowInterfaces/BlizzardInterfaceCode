-- This file is executed at the end of addon load

-- Adjust Macro text
MacroFrameCharLimitText:SetPoint("BOTTOM", "MacroFrame", "BOTTOM", -15, 30);
MacroFrameCharLimitText:SetFontObject(SpellFont_Small);

MacroFrameEnterMacroText:SetPoint("TOPLEFT", "MacroFrameSelectedMacroBackground", "BOTTOMLEFT", 8, 7);

-- Adjust Macro Name Input Box's Texture Width
MacroPopupFrame.BorderBox.IconSelectorEditBox.IconSelectorPopupNameMiddle:SetWidth(190);