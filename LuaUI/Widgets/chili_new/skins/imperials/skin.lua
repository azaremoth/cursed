

--//=============================================================================
--// Skin

local skin = {
  info = {
    name    = "imperials",
    version = "1.0",
    author  = "aZaremoth",
  }
}

--//=============================================================================
--//

skin.general = {
  focusColor  = {0.12, 0.98, 0.98, 0.5},
  borderColor = {1.0, 1.0, 1.0, 1.0},

  font = {
   -- font    = SKINDIR .. "fonts/n019003l.pfb",
    color        = {1,1,1,1},
   -- outlineColor = {0.05,0.05,0.05,0.9},
    outline = false,
    shadow  = false,
    size    = 14,
  },

  --padding         = {5, 5, 5, 5}, --// padding: left, top, right, bottom
}


skin.icons = {
  imageplaceholder = ":cl:placeholder.png",
}

skin.button = {
  TileImageBK = ":cl:button.png",
  TileImageFG = ":cl:button_fg.png",
  tiles = {22, 22, 22, 22}, --// tile widths: left,top,right,bottom
  padding = {10, 10, 10, 10},

  backgroundColor = {1, 1, 1, 0.7},
  borderColor = {1,1,1,0},

  DrawControl = DrawButton,
}

skin.combobox = {
	TileImageBK = ":cl:combobox_ctrl.png",
	TileImageFG = ":cl:combobox_ctrl_fg.png",
	TileImageArrow = ":cl:combobox_ctrl_arrow.png",
	tiles   = {22, 22, 48, 22},
	padding = {10, 10, 24, 10},

	backgroundColor = {1, 1, 1, 0.7},
	borderColor = {1,1,1,0},

	DrawControl = DrawComboBox,
}


skin.combobox_window = {
	clone     = "window";
	TileImage = ":cl:combobox_wnd.png";
	tiles     = {10, 10, 10, 10};
	padding   = {4, 3, 3, 4};
}


skin.combobox_scrollpanel = {
	clone       = "scrollpanel";
	borderColor = {1, 1, 1, 0};
	padding     = {0, 0, 0, 0};
}


skin.combobox_item = {
	clone       = "button";
	borderColor = {1, 1, 1, 0};
}


skin.checkbox = {
  TileImageFG = ":cl:tech_checkbox_checked.png",
  TileImageBK = ":cl:tech_checkbox_unchecked.png",
  tiles       = {3,3,3,3},
  boxsize     = 13,

  DrawControl = DrawCheckbox,
}

skin.editbox = {
  hintFont = table.merge({color = {1,1,1,0.7}}, skin.general.font),
  
  backgroundColor = {0.1, 0.1, 0.1, 0.7},
  cursorColor     = {1.0, 0.7, 0.1, 0.8},

  TileImageBK = ":cl:window.png",
  TileImageFG = ":cl:menue_frame.png",
  tiles       = {14,14,14,14},

  DrawControl = DrawEditBox,
}

skin.textbox = {
  hintFont = table.merge({color = {1,1,1,0.7}}, skin.general.font),

  TileImageBK = ":cl:window.png",
  TileImageFG = ":cl:menue_frame.png",
  tiles       = {14,14,14,14},

  borderColor     = {0.0, 0.0, 0.0, 0.0},
  focusColor      = {0.0, 0.0, 0.0, 0.0},

  DrawControl = DrawEditBox,
}

skin.imagelistview = {
  imageFolder      = "folder.png",
  imageFolderUp    = "folder_up.png",

  --DrawControl = DrawBackground,

  colorBK          = {1,1,1,0.3},
  colorBK_selected = {1,0.7,0.1,0.8},

  colorFG          = {0, 0, 0, 0},
  colorFG_selected = {1,1,1,1},

  imageBK  = ":cl:node_selected_bw.png",
  imageFG  = ":cl:node_selected.png",
  tiles    = {9, 9, 9, 9},

  DrawItemBackground = DrawItemBkGnd,
}

skin.panel = {
  TileImageBK = ":cl:window.png",
  TileImageFG = ":cl:empty.png",
  tiles = {22, 22, 22, 22},

  DrawControl = DrawPanel,
}

skin.progressbar = {
  TileImageFG = ":cl:tech_progressbar_full.png",
  TileImageBK = ":cl:tech_progressbar_empty.png",
  tiles       = {10, 10, 10, 10},

  font = {
    shadow = true,
  },

  backgroundColor = {1,1,1,1},

  DrawControl = DrawProgressbar,
}

skin.scrollpanel = {
  BorderTileImage = ":cl:menue_frame.png",
  bordertiles = {14,14,14,14},

  BackgroundTileImage = ":cl:window.png",
  bkgndtiles = {14,14,14,14},

  TileImage = ":cl:tech_scrollbar.png",
  tiles     = {7,7,7,7},
  KnobTileImage = ":cl:tech_scrollbar_knob.png",
  KnobTiles     = {6,8,6,8},

  HTileImage = ":cl:tech_scrollbar.png",
  htiles     = {7,7,7,7},
  HKnobTileImage = ":cl:tech_scrollbar_knob.png",
  HKnobTiles     = {6,8,6,8},

  KnobColorSelected = {1,0.7,0.1,0.8},

  padding = {5, 5, 5, 0},

  scrollbarSize = 11,
  DrawControl = DrawScrollPanel,
  DrawControlPostChildren = DrawScrollPanelBorder,
}

skin.trackbar = {
  TileImage = ":cn:trackbar.png",
  tiles     = {10, 14, 10, 14}, --// tile widths: left,top,right,bottom

  ThumbImage = ":cl:trackbar_thumb.png",
  StepImage  = ":cl:trackbar_step.png",

  hitpadding  = {4, 4, 5, 4},

  DrawControl = DrawTrackbar,
}

skin.treeview = {
  ImageNodeSelected = ":cl:node_selected.png",
  tiles = {9, 9, 9, 9},

  ImageExpanded  = ":cl:treeview_node_expanded.png",
  ImageCollapsed = ":cl:treeview_node_collapsed.png",
  treeColor = {1,1,1,0.1},

  DrawNode = DrawTreeviewNode,
  DrawNodeTree = DrawTreeviewNodeTree,
}

skin.window = {
  TileImage = ":c:button.png",
  tiles = {62, 62, 62, 62}, --// tile widths: left,top,right,bottom
  padding = {13, 13, 13, 13},
  hitpadding = {4, 4, 4, 4},

  captionColor = {1, 1, 1, 0.45},

  backgroundColor = {0.1, 0.1, 0.1, 0.7},

  boxes = {
    resize = {-21, -21, -10, -10},
    drag = {0, 0, "100%", 10},
  },

  NCHitTest = NCHitTestWithPadding,
  NCMouseDown = WindowNCMouseDown,
  NCMouseDownPostChildren = WindowNCMouseDownPostChildren,

  DrawControl = DrawWindow,
  DrawDragGrip = function() end,
  DrawResizeGrip = DrawResizeGrip,
}

skin.line = {
  TileImage = ":cl:tech_line.png",
  tiles = {0, 0, 0, 0},
  TileImageV = ":cl:tech_line_vert.png",
  tilesV = {0, 0, 0, 0},
  DrawControl = DrawLine,
}

skin.tabbar = {
  padding = {3, 1, 1, 0},
}

skin.tabbaritem = { -- tab bar
  TileImageBK = ":cl:tech_tabbaritem_bk.png",
  TileImageFG = ":cl:tech_tabbaritem_fg.png",
  tiles = {10, 10, 10, 0}, --// tile widths: left,top,right,bottom
  padding = {5, 3, 3, 2},
  backgroundColor = {1, 1, 1, 1.0},

  DrawControl = DrawTabBarItem,
}


skin.control = skin.general


--//=============================================================================
--//

return skin
