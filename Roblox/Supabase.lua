--[[

.                    
                               .'                     
     .   ,  : `..:.  .-.      ;-.   .-.       .  .-.  
   .';  ;   ;  ;;  :;   :    ;   ; ;   :    .';.;.-'  
 .' .'.'`..:;._;;_.``:::'-'.'`::'`-`:::'-'.' .' `:::' 
'             .;'                        '            
spells supabase for screen readers
made with <3 by <@480813065701687306> on discord.
modulescript that provides support for supabase ban system (https://supabase.com/)
this requires that you have something already and a table, named whatever.

READ THE LISENCE!!
CC BY 3.0
]]


local httpService = game:GetService("HttpService")
local config = require(script.sbConfig)
local apiKey = config.Api_Key
local baseUrl = config.Base_Url

local supabase = {}

-- Add a few functions to the table
function supabase.ban(id, rbxMod, hReason)
	-- uid is roblox userid
	if hReason == nil then
		hReason = 'Not Provided.'
	end
	local response = httpService:RequestAsync({
		Url = baseUrl, -- This website helps debug HTTP requests
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json", -- 
			["apikey"] = apiKey,
			["Authorization"] = 'Bearer '..apiKey,

		},
		Body = httpService:JSONEncode({ rbxId = id, mod = rbxMod, reason = hReason}),
	})
	print(response)
end


function supabase.unban(id)
	local unbanurl = baseUrl.."?rbxId=eq."
	local response = httpService:RequestAsync({
		Url = unbanurl..id,
		Method = "DELETE",
		Headers = {
			["apikey"] = apiKey,
			["Authorization"] = 'Bearer '..apiKey,
		},
	})
	print(response)
end

-- ModuleScripts must return exactly one value
return supabase
