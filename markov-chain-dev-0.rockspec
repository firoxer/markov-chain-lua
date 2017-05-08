package = "markov-chain"
version = "dev-0"

source = {
  url = "git://github.com/firoxer/markov-chain-lua.git"
}

description = {
  summary = "Markov chain implementation",
  detailed = [[
	Markov chain implementation
  ]],
  homepage = "https://github.com/firoxer/markov-chain-lua",
  license = "MIT",
  maintainer = "Oliver Vartiainen <oliver@iki.fi>"
}

dependencies = {
  "lua >= 5.1"
}

build = {
  type = "builtin",
  modules = {
    simple = "markovchain/markovchain.lua"
  }
}
