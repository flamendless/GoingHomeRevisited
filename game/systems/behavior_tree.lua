local BehaviorTree = Concord.system({
	pool = {"id", "behavior_tree"},
})

function BehaviorTree:init(world)
	self.world = world

	self.pool.onAdded = function(_, e)
		local bt = e.behavior_tree
		bt.beehive = bt.beehive(self.world, e)
	end
end

function BehaviorTree:update(dt)
	for _, e in ipairs(self.pool) do
		local bt = e.behavior_tree
		bt.result = bt.beehive(self.world, e)
	end
end

if DEV then
	function BehaviorTree:debug_update()
		if not self.debug_show then return end
		self.debug_show = Slab.BeginWindow("bt", {
			Title = "BehaviorTree",
			IsOpen = self.debug_show
		})
		for _, e in ipairs(self.pool) do
			local id = e.id.value
			local bt = e.behavior_tree
			Slab.Text(id)
			Slab.SameLine()

			local current_node = bt.current_node
			if Slab.BeginComboBox("cb_nodes", {Selected = current_node}) then
				for _, node in pairs(bt.nodes) do
					Slab.TextSelectable(node)
				end
				Slab.EndComboBox()
			end
			Slab.SameLine()
			Slab.Text(bt.result)
		end
		Slab.EndWindow()
	end
end

return BehaviorTree
