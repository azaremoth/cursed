local base = piece 'base'
local box_01 = piece 'box_01'
local box_02 = piece 'box_02'
local box_03 = piece 'box_03'
local box_04 = piece 'box_04'
local box_05 = piece 'box_05'
local box_06 = piece 'box_06'
local box_07 = piece 'box_07'
local box_08 = piece 'box_08'
local barrel_01 = piece 'barrel_01'
local barrel_02 = piece 'barrel_02'
local barrel_03 = piece 'barrel_03'
local barrel_04 = piece 'barrel_04'
local barrel_05 = piece 'barrel_05'
local barrel_06 = piece 'barrel_06'

local BOOM	 = 1024+0

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(100)
	end
end
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	Explode(box_01, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_02, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_03, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_04, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_05, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_06, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )		
	Explode(box_07, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_08, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )			
	Explode(barrel_01, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )		
	Explode(barrel_02, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )		
	Explode(barrel_03, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	Explode(barrel_04, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	Explode(barrel_05, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	Explode(barrel_06, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	return (1)
end