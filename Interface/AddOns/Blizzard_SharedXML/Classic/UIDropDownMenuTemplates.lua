-- Custom dropdown buttons are instantiated by some external system.
-- When calling UIDropDownMenu_AddButton that system sets info.customFrame to the instance of the frame it wants to place on the menu.
-- The dropdown menu creates its button for the entry as it normally would, but hides all elements.  The custom frame is then anchored
-- to that button and assumes responsibility for all relevant dropdown menu operations.
-- The hidden button will request a size that it should become from the custom frame.

DropDownMenuButtonMixin = {}

function DropDownMenuButtonMixin:OnEnter(...)
	ExecuteFrameScript(self:GetParent(), "OnEnter", ...);
end

function DropDownMenuButtonMixin:OnLeave(...)
	ExecuteFrameScript(self:GetParent(), "OnLeave", ...);
end

function DropDownMenuButtonMixin:OnMouseDown(button)
	if self:IsEnabled() then
		ToggleDropDownMenu(nil, nil, self:GetParent());
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	end
end

LargeDropDownMenuButtonMixin = CreateFromMixins(DropDownMenuButtonMixin);

function LargeDropDownMenuButtonMixin:OnMouseDown(button)
	if self:IsEnabled() then
		local parent = self:GetParent();
		ToggleDropDownMenu(nil, nil, parent, parent, -8, 8);
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	end
end

UIDropDownCustomMenuEntryMixin = {};

function UIDropDownCustomMenuEntryMixin:GetPreferredEntryWidth()
	-- NOTE: Only width is currently supported, dropdown menus size vertically based on how many buttons are present.
	return self:GetWidth();
end

function UIDropDownCustomMenuEntryMixin:GetPreferredEntryHeight()
	return self:GetHeight();
end

function UIDropDownCustomMenuEntryMixin:OnSetOwningButton()
	-- for derived objects to implement
end

function UIDropDownCustomMenuEntryMixin:SetOwningButton(button)
	self:SetParent(button:GetParent());
	self.owningButton = button;
	self:OnSetOwningButton();
end

function UIDropDownCustomMenuEntryMixin:GetOwningDropdown()
	return self.owningButton:GetParent();
end

function UIDropDownCustomMenuEntryMixin:SetContextData(contextData)
	self.contextData = contextData;
end

function UIDropDownCustomMenuEntryMixin:GetContextData()
	return self.contextData;
end

function UIDropDownCustomMenuEntryMixin:OnEnter()
	UIDropDownMenu_StopCounting(self:GetOwningDropdown());
end

function UIDropDownCustomMenuEntryMixin:OnLeave()
	UIDropDownMenu_StartCounting(self:GetOwningDropdown());
end