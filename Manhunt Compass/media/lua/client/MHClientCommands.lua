--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

if not isClient() then return end

local ServerCommands = {}
local Commands = {}


Commands.player.setWeight = function(player, args)
	local otherPlayer = getPlayerByOnlineID(args.id)
	if otherPlayer then
		sendServerCommand(otherPlayer, "player", "setWeight", args)
	end
end

Commands.erosion = {};
Commands.erosion.disableForSquare = function(player, args)
    local sq = getCell():getGridSquare(args.x, args.y, args.z);
    if sq ~= nil then
        sq:disableErosion();
    end
end

Commands.event = {}
Commands.event.thunder = function(player, args)
	if args.isAll then
		local thunder = getClimateManager():getThunderStorm()
		local onlineUsers = getOnlinePlayers()
		for i=0, onlineUsers:size()-1 do
			local sq = onlineUsers:get(i):getSquare()
			thunder:triggerThunderEvent(sq:getX(), sq:getY(), true, true, true)
		end
	else
		getClimateManager():getThunderStorm():triggerThunderEvent(args.x, args.y, true, true, true)
	end
end

Events.OnClientCommand.Add(ClientCommands.OnClientCommand)
