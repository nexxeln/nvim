local status, db = pcall(require, "dashboard")
if (not status) then return end

db.custom_header= {
[[                              ]],
[[     ,     ,                  ]],
[[     |\."./|                  ]],
[[    /       \                 ]],
[[   /  _   _  \   ______       ]],
[[   \==  Y  ==/"'`      `.     ]],
[[   /`-._^_.-'\     ,-  . \    ]],
[[  /     `     \   /     \ \   ]],
[[  \  \.___./  /_ _\     / /   ]],
[[   `, \   / ,'  (,-----' /    ]],
[[     ""' '""     '------'     ]],
[[                              ]]
}

db.custom_center = {
  { icon = "    ", desc = "Find File", action = "Telescope find_files" },
  { icon = "  ", desc = "Recent", action = "Telescope oldfiles" }
}

db.custom_footer = {
  [["You are not doing it wrong if no one knows what you are doing."]],
  [[                                       - Sun Tzu, The Art of War]]
}
