local core = require "core"
local command = require "core.command"
local keymap = require "core.keymap"
local console = require "plugins.console"

command.add(nil, {
  ["project:build-project"] = function()
    core.log "Building..."
    console.run {
      command = "build",
      file_pattern = "(.*):(%d+):(%d+): (.*)$",
      on_complete = function() core.log "Build complete" end,
    }
  end
})

command.add(nil, {
  ["project:start-debugger"] = function()
    core.log "Starting Debugger..."
    console.run {
      command = "debug",
      file_pattern = "(.*):(%d+):(%d+): (.*)$",
    }
  end
})

keymap.add { ["ctrl+b"] = "project:build-project" }
keymap.add { ["ctrl+d"] = "project:start-debugger" }
