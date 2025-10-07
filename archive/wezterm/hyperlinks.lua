local hyperlinks = {
  {
    regex = "\\((\\w+://\\S+)\\)",
    format = "$1",
    highlight = 1,
  },
  {
    regex = "\\[(\\w+://\\S+)\\]",
    format = "$1",
    highlight = 1,
  },
  {
    regex = "\\{(\\w+://\\S+)\\}",
    format = "$1",
    highlight = 1,
  },
  {
    regex = "<(\\w+://\\S+)>",
    format = "$1",
    highlight = 1,
  },
  {
    regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
    format = "$1",
    highlight = 1,
  },
  {
    regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
    format = "mailto:$0",
  },
}

return hyperlinks
