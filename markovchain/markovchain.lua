local Chain = {}

function Chain:link(a, b)
   if self.links[a] == nil then self.links[a] = {} end
   if self.links[a][b] == nil then self.links[a][b] = 0 end

   self.links[a][b] = self.links[a][b] + 1
end

function Chain:pickOneAfter(sourceItem)
   if self.links[sourceItem] == nil then return nil end

   local totalItemCount = 0
   for _, itemCount in pairs(self.links[sourceItem]) do
      totalItemCount = totalItemCount + itemCount
   end

   local pickedItemPosition = math.random(totalItemCount)

   local currentPosition = 0
   for item, itemCount in pairs(self.links[sourceItem]) do
      currentPosition = currentPosition + itemCount

      if currentPosition >= pickedItemPosition then return item end
   end

   return nil
end

local function new()
   local self = {
      links = {},
   }

   setmetatable(self, {__index = Chain})

   return self
end

return { new = new }
