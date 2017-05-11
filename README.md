markov-chain-lua
===============

Markov chain module written in Lua

How to use
----------

Require the thing:

```lua
local Chain = require('markovchain/markovchain')
```

Instantiate a chain:

```lua
local chain = Chain.new()
```

Tell the chain how states are linked (replace the variables with whatever):

```lua
chain:link([stateFrom], [stateTo])
```

When you are done, you can give the chain a state and ask its opinion on a likely future state:

```lua
local nextState = chain:pickOneAfter([previousState])
```


### Example

Simple text generation:

```lua
local Chain = require('markovchain/markovchain')

local function splitTextToPairsOfWords(text)
  -- *snip*
end

local text = 'In a hole in the ground there lived a hobbit. Not a...' -- *snip*

local pairsOfWords = splitTextToPairsOfWords(text)

local chain = Chain.new()
for pair in pairs(pairsOfWords) do
  chain:link(pair[1], pair[2])
end

print(chain:pickOneAfter('Bilbo'))
-- prints "Baggins"

print(chain:pickOneAfter('Bilbo'))
-- prints "found"

print(chain:pickOneAfter('Bilbo'))
-- prints "plumped"
```
