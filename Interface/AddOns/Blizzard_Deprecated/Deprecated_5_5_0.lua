
-- These are functions are deprecated, and will be removed in the next expansion.
-- Please upgrade to the updated APIs as soon as possible.

if not IsPublicBuild() then
	return;
end

do
	-- Use C_SpecializationInfo.SetActiveSpecGroup instead.
	SetActiveTalentGroup = C_SpecializationInfo.SetActiveSpecGroup;
end