local tbl = {
  euf_bomber = {
    {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust1", onMoving=true, onActive=false}},
    {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust2", onMoving=true, onActive=false}},
  },
  euf_interceptor = {
    {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust1", onMoving=true, onActive=false}},
    {class='AirJet', options={color={0.1,0.4,0.6}, width=5, length=35, piece="emit_thrust2", onMoving=true, onActive=false}},
  },    
  euf_transport = {
    {class='AirJet', options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust1", onActive=true}},
    {class='AirJet', options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust2", onActive=true}},
	{class='AirJet', options={color={0.1,0.4,0.6}, width=8, length=15, piece="thrust3", onActive=true}},
	{class='AirJet', options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust1", emitVector = {0, 1, 0}, onActive=true}},	
	{class='AirJet', options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust2", emitVector = {0, 1, 0}, onActive=true}},	
	{class='AirJet', options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust3", emitVector = {0, 1, 0}, onActive=true}},	
	{class='AirJet', options={color={0.1,0.4,0.6}, width=6, length=8, piece="dthrust4", emitVector = {0, 1, 0}, onActive=true}},	
  }, 
  tc_acranius = {
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=35, piece="emit_thrust1", onMoving=true, onActive=false}},
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=35, piece="emit_thrust2", onMoving=true, onActive=false}},
  },
  tc_blade = {
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=25, piece="trail1", onMoving=true, onActive=false}},	
  },
  tc_seeker = {
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=25, piece="trail1", onMoving=true, onActive=false}},
  },
  tc_storage = {
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=70, piece="emit1", onActive=false}},
    {class='AirJet', options={color={0.6,1.0,0.15}, width=5, length=70, piece="emit2", onActive=false}},
  },
}
local tbl2 = {}

for unitName, data in pairs(tbl) do
  local unitDef = UnitDefNames[unitName] or {}
  data.baseSpeed = data.baseSpeed or (unitDef and unitDef.speed/30)
  data.maxDeltaSpeed = data.maxDeltaSpeed or 3
  data.accelMod = data.accelMod or 1
  data.minSpeed = data.minSpeed or 1
  for index, fx in ipairs(data) do
    local opts = fx.options
    if opts.length then
      opts.baseLength = opts.length
    end
    if opts.size then
      opts.baseSize = opts.size
    end
  end
  
  local unitDefID = unitDef.id
  if unitDefID then
    tbl2[unitDefID] = data
  end
end

return tbl2
