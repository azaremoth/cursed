local base = piece 'base'
local box_1 = piece 'box_1'
local box_2 = piece 'box_2'
local box_3 = piece 'box_3'
local box_4 = piece 'box_4'
local barrel_1 = piece 'barrel_1'
local barrel_2 = piece 'barrel_2'
local barrel_3 = piece 'barrel_3'
local barrel_4 = piece 'barrel_4'


local BOOM	 = 1024+0

function script.Create()
	while GetUnitValue(COB.BUILD_PERCENT_LEFT) > 0 do
			Sleep(100)
	end
end
	
function script.Killed( damage, health )
	EmitSfx(base,BOOM)
	Explode(box_1, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_2, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_3, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(box_4, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )	
	Explode(barrel_1, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )		
	Explode(barrel_2, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )		
	Explode(barrel_3, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	Explode(barrel_4, math.bit_or(SFX.FALL , SFX.SMOKE , SFX.FIRE , SFX.EXPLODE_ON_HIT )   )
	return (1)
end