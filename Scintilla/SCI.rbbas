#tag Module
Protected Module SCI
	#tag Method, Flags = &h1
		Protected Function GetMessageName(MsgID As Integer) As String
		  If mNames = Nil Then
		    mNames = New Dictionary(_
		    2051:"SCI_STYLESETFORE", 2052:"SCI_STYLESETBACK", 2053:"SCI_STYLESETBOLD", 2054:"SCI_STYLESETITALIC", 2055:"SCI_STYLESETSIZE", 2056:"SCI_STYLESETFONT", 2057:"SCI_STYLESETEOLFILLED", _
		    2058:"SCI_STYLERESETDEFAULT", 2059:"SCI_STYLESETUNDERLINE", 2060:"SCI_STYLESETCASE", 2066:"SCI_STYLESETCHARACTERSET", 2409:"SCI_STYLESETHOTSPOT", 2067:"SCI_SETSELFORE",  _
		    2068:"SCI_SETSELBACK", 2069:"SCI_SETCARETFORE", 2070:"SCI_ASSIGNCMDKEY", 2071:"SCI_CLEARCMDKEY", 2072:"SCI_CLEARALLCMDKEYS", 2073:"SCI_SETSTYLINGEX", 2074:"SCI_STYLESETVISIBLE",  _
		    2075:"SCI_GETCARETPERIOD", 2076:"SCI_SETCARETPERIOD", 2077:"SCI_SETWORDCHARS", 2078:"SCI_BEGINUNDOACTION", 2079:"SCI_ENDUNDOACTION", 2080:"SCI_INDICSETSTYLE", 2081:"SCI_INDICGETSTYLE", _
		    2082:"SCI_INDICSETFORE", 2083:"SCI_INDICGETFORE", 2084:"SCI_SETWHITESPACEFORE", 2085:"SCI_SETWHITESPACEBACK", 2090:"SCI_SETSTYLEBITS", 2091:"SCI_GETSTYLEBITS", 2092:"SCI_SETLINESTATE", _
		    2093:"SCI_GETLINESTATE", 2094:"SCI_GETMAXLINESTATE", 2095:"SCI_GETCARETLINEVISIBLE", 2096:"SCI_SETCARETLINEVISIBLE", 2097:"SCI_GETCARETLINEBACK", 2098:"SCI_SETCARETLINEBACK",  _
		    2099:"SCI_STYLESETCHANGEABLE", 2100:"SCI_AUTOCSHOW", 2101:"SCI_AUTOCCANCEL", 2102:"SCI_AUTOCACTIVE", 2103:"SCI_AUTOCPOSSTART", 2104:"SCI_AUTOCCOMPLETE", 2105:"SCI_AUTOCSTOPS",  _
		    2106:"SCI_AUTOCSETSEPARATOR", 2107:"SCI_AUTOCGETSEPARATOR", 2108:"SCI_AUTOCSELECT", 2110:"SCI_AUTOCSETCANCELATSTART", 2111:"SCI_AUTOCGETCANCELATSTART", 2112:"SCI_AUTOCSETFILLUPS",  _
		    2113:"SCI_AUTOCSETCHOOSESINGLE", 2114:"SCI_AUTOCGETCHOOSESINGLE", 2115:"SCI_AUTOCSETIGNORECASE", 2116:"SCI_AUTOCGETIGNORECASE", 2117:"SCI_USERLISTSHOW", 2118:"SCI_AUTOCSETAUTOHIDE",  _
		    2119:"SCI_AUTOCGETAUTOHIDE", 2270:"SCI_AUTOCSETDROPRESTOFWORD", 2271:"SCI_AUTOCGETDROPRESTOFWORD", 2405:"SCI_REGISTERIMAGE", 2408:"SCI_CLEARREGISTEREDIMAGES",  _
		    2285:"SCI_AUTOCGETTYPESEPARATOR", 2286:"SCI_AUTOCSETTYPESEPARATOR", 2122:"SCI_SETINDENT", 2123:"SCI_GETINDENT", 2124:"SCI_SETUSETABS", 2125:"SCI_GETUSETABS",  _
		    2126:"SCI_SETLINEINDENTATION", 2127:"SCI_GETLINEINDENTATION", 2128:"SCI_GETLINEINDENTPOSITION", 2129:"SCI_GETCOLUMN", 2130:"SCI_SETHSCROLLBAR", 2131:"SCI_GETHSCROLLBAR",  _
		    2132:"SCI_SETINDENTATIONGUIDES", 2133:"SCI_GETINDENTATIONGUIDES", 2134:"SCI_SETHIGHLIGHTGUIDE", 2135:"SCI_GETHIGHLIGHTGUIDE", 2136:"SCI_GETLINEENDPOSITION", 2137:"SCI_GETCODEPAGE",  _
		    2138:"SCI_GETCARETFORE", 2139:"SCI_GETUSEPALETTE", 2140:"SCI_GETREADONLY", 2141:"SCI_SETCURRENTPOS", 2142:"SCI_SETSELECTIONSTART", 2143:"SCI_GETSELECTIONSTART",  _
		    2144:"SCI_SETSELECTIONEND", 2145:"SCI_GETSELECTIONEND", 2146:"SCI_SETPRINTMAGNIFICATION", 2147:"SCI_GETPRINTMAGNIFICATION", 2148:"SCI_SETPRINTCOLOURMODE", 2149:"SCI_GETPRINTCOLOURMODE", _
		    2150:"SCI_FINDTEXT", 2151:"SCI_FORMATRANGE", 2152:"SCI_GETFIRSTVISIBLELINE", 2153:"SCI_GETLINE", 2154:"SCI_GETLINECOUNT", 2155:"SCI_SETMARGINLEFT", 2156:"SCI_GETMARGINLEFT",  _
		    2157:"SCI_SETMARGINRIGHT", 2158:"SCI_GETMARGINRIGHT", 2159:"SCI_GETMODIFY", 2160:"SCI_SETSEL", 2161:"SCI_GETSELTEXT", 2162:"SCI_GETTEXTRANGE", 2163:"SCI_HIDESELECTION",  _
		    2164:"SCI_POINTXFROMPOSITION", 2165:"SCI_POINTYFROMPOSITION", 2166:"SCI_LINEFROMPOSITION", 2167:"SCI_POSITIONFROMLINE", 2168:"SCI_LINESCROLL", 2169:"SCI_SCROLLCARET",  _
		    2170:"SCI_REPLACESEL", 2171:"SCI_SETREADONLY", 2172:"SCI_NULL", 2173:"SCI_CANPASTE", 2174:"SCI_CANUNDO", 2175:"SCI_EMPTYUNDOBUFFER", 2176:"SCI_UNDO", 2177:"SCI_CUT", 2178:"SCI_COPY",  _
		    2179:"SCI_PASTE", 2180:"SCI_CLEAR", 2181:"SCI_SETTEXT", 2182:"SCI_GETTEXT", 2183:"SCI_GETTEXTLENGTH", 2184:"SCI_GETDIRECTFUNCTION", 2185:"SCI_GETDIRECTPOINTER", 2186:"SCI_SETOVERTYPE", _
		    2187:"SCI_GETOVERTYPE", 2188:"SCI_SETCARETWIDTH", 2189:"SCI_GETCARETWIDTH", 2190:"SCI_SETTARGETSTART", 2191:"SCI_GETTARGETSTART", 2192:"SCI_SETTARGETEND", 2193:"SCI_GETTARGETEND",  _
		    2194:"SCI_REPLACETARGET", 2195:"SCI_REPLACETARGETRE", 2197:"SCI_SEARCHINTARGET", 2198:"SCI_SETSEARCHFLAGS", 2199:"SCI_GETSEARCHFLAGS", 2200:"SCI_CALLTIPSHOW", 2201:"SCI_CALLTIPCANCEL", _
		    2202:"SCI_CALLTIPACTIVE", 2203:"SCI_CALLTIPPOSSTART", 2204:"SCI_CALLTIPSETHLT", 2205:"SCI_CALLTIPSETBACK", 2206:"SCI_CALLTIPSETFORE", 2207:"SCI_CALLTIPSETFOREHLT",  _
		    2220:"SCI_VISIBLEFROMDOCLINE", 2221:"SCI_DOCLINEFROMVISIBLE", 2222:"SCI_SETFOLDLEVEL", 2223:"SCI_GETFOLDLEVEL", 2224:"SCI_GETLASTCHILD", 2225:"SCI_GETFOLDPARENT", 2226:"SCI_SHOWLINES", _
		    2227:"SCI_HIDELINES", 2228:"SCI_GETLINEVISIBLE", 2229:"SCI_SETFOLDEXPANDED", 2230:"SCI_GETFOLDEXPANDED", 2231:"SCI_TOGGLEFOLD", 2232:"SCI_ENSUREVISIBLE", 2233:"SCI_SETFOLDFLAGS",  _
		    2234:"SCI_ENSUREVISIBLEENFORCEPOLICY", 2260:"SCI_SETTABINDENTS", 2261:"SCI_GETTABINDENTS", 2262:"SCI_SETBACKSPACEUNINDENTS", 2263:"SCI_GETBACKSPACEUNINDENTS",  _
		    2264:"SCI_SETMOUSEDWELLTIME", 2265:"SCI_GETMOUSEDWELLTIME", 2266:"SCI_WORDSTARTPOSITION", 2267:"SCI_WORDENDPOSITION", 2268:"SCI_SETWRAPMODE", 2269:"SCI_GETWRAPMODE",  _
		    2272:"SCI_SETLAYOUTCACHE", 2273:"SCI_GETLAYOUTCACHE", 2274:"SCI_SETSCROLLWIDTH", 2275:"SCI_GETSCROLLWIDTH", 2276:"SCI_TEXTWIDTH", 2277:"SCI_SETENDATLASTLINE",  _
		    2278:"SCI_GETENDATLASTLINE", 2279:"SCI_TEXTHEIGHT", 2280:"SCI_SETVSCROLLBAR", 2281:"SCI_GETVSCROLLBAR", 2282:"SCI_APPENDTEXT", 2283:"SCI_GETTWOPHASEDRAW", 2284:"SCI_SETTWOPHASEDRAW",  _
		    2287:"SCI_TARGETFROMSELECTION", 2288:"SCI_LINESJOIN", 2289:"SCI_LINESSPLIT", 2290:"SCI_SETFOLDMARGINCOLOUR", 2291:"SCI_SETFOLDMARGINHICOLOUR", 2300:"SCI_LINEDOWN",  _
		    2301:"SCI_LINEDOWNEXTEND", 2302:"SCI_LINEUP", 2303:"SCI_LINEUPEXTEND", 2304:"SCI_CHARLEFT", 2305:"SCI_CHARLEFTEXTEND", 2306:"SCI_CHARRIGHT", 2307:"SCI_CHARRIGHTEXTEND",  _
		    2308:"SCI_WORDLEFT", 2309:"SCI_WORDLEFTEXTEND", 2310:"SCI_WORDRIGHT", 2311:"SCI_WORDRIGHTEXTEND", 2312:"SCI_HOME", 2313:"SCI_HOMEEXTEND", 2314:"SCI_LINEEND", 2315:"SCI_LINEENDEXTEND",  _
		    2316:"SCI_DOCUMENTSTART", 2317:"SCI_DOCUMENTSTARTEXTEND", 2318:"SCI_DOCUMENTEND", 2319:"SCI_DOCUMENTENDEXTEND", 2320:"SCI_PAGEUP", 2321:"SCI_PAGEUPEXTEND", 2322:"SCI_PAGEDOWN",  _
		    2323:"SCI_PAGEDOWNEXTEND", 2324:"SCI_EDITTOGGLEOVERTYPE", 2325:"SCI_CANCEL", 2326:"SCI_DELETEBACK", 2327:"SCI_TAB", 2328:"SCI_BACKTAB", 2329:"SCI_NEWLINE", 2330:"SCI_FORMFEED",  _
		    2331:"SCI_VCHOME", 2332:"SCI_VCHOMEEXTEND", 2333:"SCI_ZOOMIN", 2334:"SCI_ZOOMOUT", 2335:"SCI_DELWORDLEFT", 2336:"SCI_DELWORDRIGHT", 2337:"SCI_LINECUT", 2338:"SCI_LINEDELETE",  _
		    2339:"SCI_LINETRANSPOSE", 2404:"SCI_LINEDUPLICATE", 2340:"SCI_LOWERCASE", 2341:"SCI_UPPERCASE", 2342:"SCI_LINESCROLLDOWN", 2343:"SCI_LINESCROLLUP", 2344:"SCI_DELETEBACKNOTLINE",  _
		    2345:"SCI_HOMEDISPLAY", 2346:"SCI_HOMEDISPLAYEXTEND", 2347:"SCI_LINEENDDISPLAY", 2348:"SCI_LINEENDDISPLAYEXTEND", 2349:"SCI_HOMEWRAP", 2450:"SCI_HOMEWRAPEXTEND", 2451:"SCI_LINEENDWRAP", _
		    2452:"SCI_LINEENDWRAPEXTEND", 2453:"SCI_VCHOMEWRAP", 2454:"SCI_VCHOMEWRAPEXTEND", 2455:"SCI_LINECOPY", 2401:"SCI_MOVECARETINSIDEVIEW", 2350:"SCI_LINELENGTH", 2351:"SCI_BRACEHIGHLIGHT", _
		    2352:"SCI_BRACEBADLIGHT", 2353:"SCI_BRACEMATCH", 2355:"SCI_GETVIEWEOL", 2356:"SCI_SETVIEWEOL", 2357:"SCI_GETDOCPOINTER", 2358:"SCI_SETDOCPOINTER", 2359:"SCI_SETMODEVENTMASK",  _
		    2360:"SCI_GETEDGECOLUMN", 2361:"SCI_SETEDGECOLUMN", 2362:"SCI_GETEDGEMODE", 2363:"SCI_SETEDGEMODE", 2364:"SCI_GETEDGECOLOUR", 2365:"SCI_SETEDGECOLOUR", 2366:"SCI_SEARCHANCHOR",  _
		    2367:"SCI_SEARCHNEXT", 2368:"SCI_SEARCHPREV", 2370:"SCI_LINESONSCREEN", 2371:"SCI_USEPOPUP", 2372:"SCI_SELECTIONISRECTANGLE", 2373:"SCI_SETZOOM", 2374:"SCI_GETZOOM",  _
		    2375:"SCI_CREATEDOCUMENT", 2376:"SCI_ADDREFDOCUMENT", 2377:"SCI_RELEASEDOCUMENT", 2378:"SCI_GETMODEVENTMASK", 2380:"SCI_SETFOCUS", 2381:"SCI_GETFOCUS", 2382:"SCI_SETSTATUS",  _
		    2383:"SCI_GETSTATUS", 2384:"SCI_SETMOUSEDOWNCAPTURES", 2385:"SCI_GETMOUSEDOWNCAPTURES", 2386:"SCI_SETCURSOR", 2387:"SCI_GETCURSOR", 2388:"SCI_SETCONTROLCHARSYMBOL",  _
		    2389:"SCI_GETCONTROLCHARSYMBOL", 2390:"SCI_WORDPARTLEFT", 2391:"SCI_WORDPARTLEFTEXTEND", 2392:"SCI_WORDPARTRIGHT", 2393:"SCI_WORDPARTRIGHTEXTEND", 2394:"SCI_SETVISIBLEPOLICY",  _
		    2395:"SCI_DELLINELEFT", 2396:"SCI_DELLINERIGHT", 2397:"SCI_SETXOFFSET", 2398:"SCI_GETXOFFSET", 2399:"SCI_CHOOSECARETX", 2400:"SCI_GRABFOCUS", 2402:"SCI_SETXCARETPOLICY",  _
		    2403:"SCI_SETYCARETPOLICY", 2406:"SCI_SETPRINTWRAPMODE", 2407:"SCI_GETPRINTWRAPMODE", 2410:"SCI_SETHOTSPOTACTIVEFORE", 2411:"SCI_SETHOTSPOTACTIVEBACK",  _
		    2412:"SCI_SETHOTSPOTACTIVEUNDERLINE", 2421:"SCI_SETHOTSPOTSINGLELINE", 2413:"SCI_PARADOWN", 2414:"SCI_PARADOWNEXTEND", 2415:"SCI_PARAUP", 2416:"SCI_PARAUPEXTEND",  _
		    2417:"SCI_POSITIONBEFORE", 2418:"SCI_POSITIONAFTER", 2419:"SCI_COPYRANGE", 2420:"SCI_COPYTEXT", 2422:"SCI_SETSELECTIONMODE", 2423:"SCI_GETSELECTIONMODE",  _
		    2424:"SCI_GETLINESELSTARTPOSITION", 2425:"SCI_GETLINESELENDPOSITION", 2426:"SCI_LINEDOWNRECTEXTEND", 2427:"SCI_LINEUPRECTEXTEND", 2428:"SCI_CHARLEFTRECTEXTEND",  _
		    2429:"SCI_CHARRIGHTRECTEXTEND", 2430:"SCI_HOMERECTEXTEND", 2431:"SCI_VCHOMERECTEXTEND", 2432:"SCI_LINEENDRECTEXTEND", 2433:"SCI_PAGEUPRECTEXTEND", 2434:"SCI_PAGEDOWNRECTEXTEND",  _
		    2435:"SCI_STUTTEREDPAGEUP", 2436:"SCI_STUTTEREDPAGEUPEXTEND", 2437:"SCI_STUTTEREDPAGEDOWN", 2438:"SCI_STUTTEREDPAGEDOWNEXTEND", 2439:"SCI_WORDLEFTEND", 2440:"SCI_WORDLEFTENDEXTEND",  _
		    2441:"SCI_WORDRIGHTEND", 2442:"SCI_WORDRIGHTENDEXTEND", 2443:"SCI_SETWHITESPACECHARS", 2444:"SCI_SETCHARSDEFAULT", 2445:"SCI_AUTOCGETCURRENT", 2446:"SCI_ALLOCATE", 3001:"SCI_STARTRECORD", _
		    3002:"SCI_STOPRECORD", 4001:"SCI_SETLEXER", 4002:"SCI_GETLEXER", 4003:"SCI_COLOURISE", 4004:"SCI_SETPROPERTY", 4005:"SCI_SETKEYWORDS", 4006:"SCI_SETLEXERLANGUAGE", 4007:"SCI_LOADLEXERLIBRARY", _
		    2024:"SCI_GOTOLINE", 2014:"SCI_SETSAVEPOINT", 2034:"SCI_GETBUFFEREDDRAW", 2041:"SCI_SETCURRENTPOS", 2013:"SCI_SELECTALL", 2007:"SCI_GETCHARAT", 2002:"SCI_SAVEPOINTREACHED", _
		    2008:"GETCURRENTPOS", 2003:"INSERTTEXT", 2001:"ADDTEXT", 2000:"START", 2046:"MARKERGET")
		  End If
		  
		  Return mNames.Lookup(MsgID, "Undefined")
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mNames As Dictionary
	#tag EndProperty


	#tag Constant, Name = ADDREFDOCUMENT, Type = Double, Dynamic = False, Default = \"2376", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADDSELECTION, Type = Double, Dynamic = False, Default = \"2573", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADDTEXT, Type = Double, Dynamic = False, Default = \"2001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ADDUNDOACTION, Type = Double, Dynamic = False, Default = \"2560", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONGETSTYLE, Type = Double, Dynamic = False, Default = \"2543", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONGETTEXT, Type = Double, Dynamic = False, Default = \"2541", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONGETVISIBLE, Type = Double, Dynamic = False, Default = \"2549", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONSETSTYLE, Type = Double, Dynamic = False, Default = \"2542", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONSETTEXT, Type = Double, Dynamic = False, Default = \"2540", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ANNOTATIONSETVISIBLE, Type = Double, Dynamic = False, Default = \"2548", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = APPENDTEXT, Type = Double, Dynamic = False, Default = \"2282", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ASSIGNCMDKEY, Type = Double, Dynamic = False, Default = \"2070", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCCANCEL, Type = Double, Dynamic = False, Default = \"2101", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCCOMPLETE, Type = Double, Dynamic = False, Default = \"2104", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCGETCURRENT, Type = Double, Dynamic = False, Default = \"2445", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCGETSEPARATOR, Type = Double, Dynamic = False, Default = \"2107", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCSELECT, Type = Double, Dynamic = False, Default = \"2108\r", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCSETSEPARATOR, Type = Double, Dynamic = False, Default = \"2106", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCSHOW, Type = Double, Dynamic = False, Default = \"2100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BACKTAB, Type = Double, Dynamic = False, Default = \"2328", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BEGINUNDOACTION, Type = Double, Dynamic = False, Default = \"2078", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPACTIVE, Type = Double, Dynamic = False, Default = \"2202", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPCANCEL, Type = Double, Dynamic = False, Default = \"2201", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPPOSSTART, Type = Double, Dynamic = False, Default = \"2203", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPSETPOSSTART, Type = Double, Dynamic = False, Default = \"2214", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPSHOW, Type = Double, Dynamic = False, Default = \"2200", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CANCEL, Type = Double, Dynamic = False, Default = \"2325", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CANPASTE, Type = Double, Dynamic = False, Default = \"2173", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CANREDO, Type = Double, Dynamic = False, Default = \"2016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CANUNDO, Type = Double, Dynamic = False, Default = \"2174", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHANGELEXERSTATE, Type = Double, Dynamic = False, Default = \"2617", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARLEFT, Type = Double, Dynamic = False, Default = \"2304", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARLEFTEXTEND, Type = Double, Dynamic = False, Default = \"2305", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARLEFTRECTEXTEND, Type = Double, Dynamic = False, Default = \"2428", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARPOSITIONFROMPOINT, Type = Double, Dynamic = False, Default = \"2561", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARPOSITIONFROMPOINTCLOSE, Type = Double, Dynamic = False, Default = \"2562", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARRIGHT, Type = Double, Dynamic = False, Default = \"2306", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARRIGHTEXTEND, Type = Double, Dynamic = False, Default = \"2307", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARRIGHTRECTEXTEND, Type = Double, Dynamic = False, Default = \"2429", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLEAR, Type = Double, Dynamic = False, Default = \"2180", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLEARALL, Type = Double, Dynamic = False, Default = \"2004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLEARALLCMDKEYS, Type = Double, Dynamic = False, Default = \"2072", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLEARCMDKEY, Type = Double, Dynamic = False, Default = \"2071", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLEARDOCUMENTSTYLE, Type = Double, Dynamic = False, Default = \"2005", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COLORISE, Type = Double, Dynamic = False, Default = \"4003", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CONVERTEOLS, Type = Double, Dynamic = False, Default = \"2029", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COPY, Type = Double, Dynamic = False, Default = \"2178", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COPYALLOWLINE, Type = Double, Dynamic = False, Default = \"2519", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COPYRANGE, Type = Double, Dynamic = False, Default = \"2419", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CREATEDOCUMENT, Type = Double, Dynamic = False, Default = \"2375", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CUT, Type = Double, Dynamic = False, Default = \"2177", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELETEBACK, Type = Double, Dynamic = False, Default = \"2326", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELETEBACKNOTLINE, Type = Double, Dynamic = False, Default = \"2344", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELLINELEFT, Type = Double, Dynamic = False, Default = \"2395", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELLINERIGHT, Type = Double, Dynamic = False, Default = \"2396", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELWORDLEFT, Type = Double, Dynamic = False, Default = \"2335", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELWORDRIGHT, Type = Double, Dynamic = False, Default = \"2336", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DELWORDRIGHTEND, Type = Double, Dynamic = False, Default = \"2518", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DESCRIBEPROPERTY, Type = Double, Dynamic = False, Default = \"4016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DOCUMENTEND, Type = Double, Dynamic = False, Default = \"2318", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DOCUMENTENDEXTEND, Type = Double, Dynamic = False, Default = \"2319", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DOCUMENTSTART, Type = Double, Dynamic = False, Default = \"2316", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DOCUMENTSTARTEXTEND, Type = Double, Dynamic = False, Default = \"2317", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DROPSELECTION, Type = Double, Dynamic = False, Default = \"2671", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EDITTOGGLEOVERTYPE, Type = Double, Dynamic = False, Default = \"2324", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EMPTYUNDOBUFFER, Type = Double, Dynamic = False, Default = \"2175", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ENDUNDOACTION, Type = Double, Dynamic = False, Default = \"2079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FINDTEXT, Type = Double, Dynamic = False, Default = \"2150", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FORMATRANGE, Type = Double, Dynamic = False, Default = \"2151", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FORMFEED, Type = Double, Dynamic = False, Default = \"2330", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETANCHOR, Type = Double, Dynamic = False, Default = \"2009", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETBUFFEREDDRAW, Type = Double, Dynamic = False, Default = \"2034", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETCARETPERIOD, Type = Double, Dynamic = False, Default = \"2075", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETCHARAT, Type = Double, Dynamic = False, Default = \"2007", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETCURLINE, Type = Double, Dynamic = False, Default = \"2027", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETDIRECTFUNCTION, Type = Double, Dynamic = False, Default = \"2184", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETDIRECTPOINTER, Type = Double, Dynamic = False, Default = \"2185", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETDOCPOINTER, Type = Double, Dynamic = False, Default = \"2357", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETENDATLASTLINE, Type = Double, Dynamic = False, Default = \"2278", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETENDSTYLED, Type = Double, Dynamic = False, Default = \"2028", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETEOLMODE, Type = Double, Dynamic = False, Default = \"2030", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETEXTRAASCENT, Type = Double, Dynamic = False, Default = \"2526", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETEXTRADESCENT, Type = Double, Dynamic = False, Default = \"2528", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETFOCUS, Type = Double, Dynamic = False, Default = \"2381", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETHSCROLLBAR, Type = Double, Dynamic = False, Default = \"2131", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLENGTH, Type = Double, Dynamic = False, Default = \"2006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLEXER, Type = Double, Dynamic = False, Default = \"4002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLEXERLANGUAGE, Type = Double, Dynamic = False, Default = \"4012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLINE, Type = Double, Dynamic = False, Default = \"2153", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLINECOUNT, Type = Double, Dynamic = False, Default = \"2154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLINEENDPOSITION, Type = Double, Dynamic = False, Default = \"2136", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETLINESTATE, Type = Double, Dynamic = False, Default = \"2093", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMAINSELECTION, Type = Double, Dynamic = False, Default = \"2575", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMARGINMASKN, Type = Double, Dynamic = False, Default = \"2245", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2247", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2241", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2243", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMODEVENTMASK, Type = Double, Dynamic = False, Default = \"2378", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMODIFY, Type = Double, Dynamic = False, Default = \"2159", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMOUSEDOWNCAPTURES, Type = Double, Dynamic = False, Default = \"2385", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMOUSEDWELLTIME, Type = Double, Dynamic = False, Default = \"2265", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETMULTIPLESELECTION, Type = Double, Dynamic = False, Default = \"2564", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETOVERTYPE, Type = Double, Dynamic = False, Default = \"2187", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETPASTECONVERTENDINGS, Type = Double, Dynamic = False, Default = \"2468", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETPRINTCOLOURMODE, Type = Double, Dynamic = False, Default = \"2149", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETPRINTMAGNIFICATION, Type = Double, Dynamic = False, Default = \"2147", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETPRINTWRAPMODE, Type = Double, Dynamic = False, Default = \"2407", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETPROPERTY, Type = Double, Dynamic = False, Default = \"4008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETREADONLY, Type = Double, Dynamic = False, Default = \"2140", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETREPRESENTATION, Type = Double, Dynamic = False, Default = \"2666", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSEARCHFLAGS, Type = Double, Dynamic = False, Default = \"2199", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONEMPTY, Type = Double, Dynamic = False, Default = \"2650", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONEND, Type = Double, Dynamic = False, Default = \"2145", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONNANCHOR, Type = Double, Dynamic = False, Default = \"2579", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONNCARET, Type = Double, Dynamic = False, Default = \"2577", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONS, Type = Double, Dynamic = False, Default = \"2570", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELECTIONSTART, Type = Double, Dynamic = False, Default = \"2143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSELTEXT, Type = Double, Dynamic = False, Default = \"2161", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSTATUS, Type = Double, Dynamic = False, Default = \"2383", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETSTYLEAT, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETTARGETEND, Type = Double, Dynamic = False, Default = \"2193", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETTARGETSTART, Type = Double, Dynamic = False, Default = \"2191", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETTEXT, Type = Double, Dynamic = False, Default = \"2182", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETTEXTRANGE, Type = Double, Dynamic = False, Default = \"2162", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETUNDOCOLLECTION, Type = Double, Dynamic = False, Default = \"2019", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETVIEWEOL, Type = Double, Dynamic = False, Default = \"2355", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETVSCROLLBAR, Type = Double, Dynamic = False, Default = \"2281", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETWRAPMODE, Type = Double, Dynamic = False, Default = \"2269", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GETZOOM, Type = Double, Dynamic = False, Default = \"2374", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GOTOLINE, Type = Double, Dynamic = False, Default = \"2024", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = GOTOPOS, Type = Double, Dynamic = False, Default = \"2025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOME, Type = Double, Dynamic = False, Default = \"2312", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMEDISPLAY, Type = Double, Dynamic = False, Default = \"2345", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMEDISPLAYEXTEND, Type = Double, Dynamic = False, Default = \"2346", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMEEXTEND, Type = Double, Dynamic = False, Default = \"2313", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMERECTEXTEND, Type = Double, Dynamic = False, Default = \"2430", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMEWRAP, Type = Double, Dynamic = False, Default = \"2349", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOMEWRAPEXTEND, Type = Double, Dynamic = False, Default = \"2450", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INSERTTEXT, Type = Double, Dynamic = False, Default = \"2003", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINECOPY, Type = Double, Dynamic = False, Default = \"2455", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINECUT, Type = Double, Dynamic = False, Default = \"2337", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEDELETE, Type = Double, Dynamic = False, Default = \"2338", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEDOWN, Type = Double, Dynamic = False, Default = \"2300", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEDOWNEXTEND, Type = Double, Dynamic = False, Default = \"2301", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEDOWNRECTEXTEND, Type = Double, Dynamic = False, Default = \"2426", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEDUPLICATE, Type = Double, Dynamic = False, Default = \"2404", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEEND, Type = Double, Dynamic = False, Default = \"2314", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDDISPLAY, Type = Double, Dynamic = False, Default = \"2347", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDDISPLAYEXTEND, Type = Double, Dynamic = False, Default = \"2348", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDEXTEND, Type = Double, Dynamic = False, Default = \"2315", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDRECTEXTEND, Type = Double, Dynamic = False, Default = \"2432", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDWRAP, Type = Double, Dynamic = False, Default = \"2451", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEENDWRAPEXTEND, Type = Double, Dynamic = False, Default = \"2452", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEFROMPOSITION, Type = Double, Dynamic = False, Default = \"2166", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINELENGTH, Type = Double, Dynamic = False, Default = \"2350", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINESCROLL, Type = Double, Dynamic = False, Default = \"2168", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINESCROLLDOWN, Type = Double, Dynamic = False, Default = \"2342", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINESCROLLUP, Type = Double, Dynamic = False, Default = \"2343", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINETRANSPOSE, Type = Double, Dynamic = False, Default = \"2339", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEUP, Type = Double, Dynamic = False, Default = \"2302", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEUPEXTEND, Type = Double, Dynamic = False, Default = \"2303", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LINEUPRECTEXTEND, Type = Double, Dynamic = False, Default = \"2427", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOWERCASE, Type = Double, Dynamic = False, Default = \"2340", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARGINGETSTYLE, Type = Double, Dynamic = False, Default = \"2533", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARGINGETTEXT, Type = Double, Dynamic = False, Default = \"2531", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARGINSETSTYLE, Type = Double, Dynamic = False, Default = \"2532", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARGINSETTEXT, Type = Double, Dynamic = False, Default = \"2530", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARKERADD, Type = Double, Dynamic = False, Default = \"2043", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARKERDELETE, Type = Double, Dynamic = False, Default = \"2044", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARKERDELETEHANDLE, Type = Double, Dynamic = False, Default = \"2018", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARKERGET, Type = Double, Dynamic = False, Default = \"2046", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARKERLINEFROMHANDLE, Type = Double, Dynamic = False, Default = \"2017", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MOVESELECTEDLINESDOWN, Type = Double, Dynamic = False, Default = \"2621", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MOVESELECTEDLINESUP, Type = Double, Dynamic = False, Default = \"2620", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NEWLINE, Type = Double, Dynamic = False, Default = \"2329", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NULL, Type = Double, Dynamic = False, Default = \"2175", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEDOWN, Type = Double, Dynamic = False, Default = \"2322", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEDOWNEXTEND, Type = Double, Dynamic = False, Default = \"2323", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEDOWNRECTEXTEND, Type = Double, Dynamic = False, Default = \"2434", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEUP, Type = Double, Dynamic = False, Default = \"2320", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEUPEXTEND, Type = Double, Dynamic = False, Default = \"2321", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAGEUPRECTEXTEND, Type = Double, Dynamic = False, Default = \"2433", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PARADOWN, Type = Double, Dynamic = False, Default = \"2413", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PARADOWNEXTEND, Type = Double, Dynamic = False, Default = \"2414", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PARAUP, Type = Double, Dynamic = False, Default = \"2415", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PARAUPEXTEND, Type = Double, Dynamic = False, Default = \"2416", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PASTE, Type = Double, Dynamic = False, Default = \"2179", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POINTXFROMPOSITION, Type = Double, Dynamic = False, Default = \"2164", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POINTYFROMPOSITION, Type = Double, Dynamic = False, Default = \"2165", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSITIONFROMLINE, Type = Double, Dynamic = False, Default = \"2167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSITIONFROMPOINT, Type = Double, Dynamic = False, Default = \"2022", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSITIONFROMPOINTCLOSE, Type = Double, Dynamic = False, Default = \"2023", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROPERTYNAMES, Type = Double, Dynamic = False, Default = \"4014", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROPERTYTYPE, Type = Double, Dynamic = False, Default = \"4015", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REDO, Type = Double, Dynamic = False, Default = \"2011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RELEASEDOCUMENT, Type = Double, Dynamic = False, Default = \"2377", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REPLACESEL, Type = Double, Dynamic = False, Default = \"2170", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REPLACETARGET, Type = Double, Dynamic = False, Default = \"2194", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REPLACETARGETRE, Type = Double, Dynamic = False, Default = \"2195", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCROLLCARET, Type = Double, Dynamic = False, Default = \"2169", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCROLLRANGE, Type = Double, Dynamic = False, Default = \"2569", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCROLLTOEND, Type = Double, Dynamic = False, Default = \"2629", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SCROLLTOSTART, Type = Double, Dynamic = False, Default = \"2628", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEARCHANCHOR, Type = Double, Dynamic = False, Default = \"2366", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEARCHINTARGET, Type = Double, Dynamic = False, Default = \"2197", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEARCHNEXT, Type = Double, Dynamic = False, Default = \"2367", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEARCHPREV, Type = Double, Dynamic = False, Default = \"2368", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SELECTALL, Type = Double, Dynamic = False, Default = \"2013", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SELECTIONDUPLICATE, Type = Double, Dynamic = False, Default = \"2469", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETANCHOR, Type = Double, Dynamic = False, Default = \"2026", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETBUFFEREDDRAW, Type = Double, Dynamic = False, Default = \"2035", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETCARETPERIOD, Type = Double, Dynamic = False, Default = \"2076", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETCURRENTPOS, Type = Double, Dynamic = False, Default = \"2041", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETDOCPOINTER, Type = Double, Dynamic = False, Default = \"2358", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETEMPTYSELECTION, Type = Double, Dynamic = False, Default = \"2147", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETENDATLASTLINE, Type = Double, Dynamic = False, Default = \"2277", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETEOLMODE, Type = Double, Dynamic = False, Default = \"2031", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETEXTRAASCENT, Type = Double, Dynamic = False, Default = \"2525", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETEXTRADESCENT, Type = Double, Dynamic = False, Default = \"2527", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETFIRSTVISIBLELINE, Type = Double, Dynamic = False, Default = \"2613", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETFOCUS, Type = Double, Dynamic = False, Default = \"2380", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETHSCROLLBAR, Type = Double, Dynamic = False, Default = \"2130", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETLEXER, Type = Double, Dynamic = False, Default = \"4001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETLEXERLANGUAGE, Type = Double, Dynamic = False, Default = \"4006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETLINESTATE, Type = Double, Dynamic = False, Default = \"2092", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMAINSELECTION, Type = Double, Dynamic = False, Default = \"2574", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMARGINMASKN, Type = Double, Dynamic = False, Default = \"2244", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMARGINSENSITIVEN, Type = Double, Dynamic = False, Default = \"2246", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMARGINTYPEN, Type = Double, Dynamic = False, Default = \"2340", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMARGINWIDTHN, Type = Double, Dynamic = False, Default = \"2242", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMODEVENTMASK, Type = Double, Dynamic = False, Default = \"2359", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMOUSEDOWNCAPTURES, Type = Double, Dynamic = False, Default = \"2384", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMOUSEDWELLTIME, Type = Double, Dynamic = False, Default = \"2264", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETMULTIPLESELECTION, Type = Double, Dynamic = False, Default = \"2563", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETOVERTYPE, Type = Double, Dynamic = False, Default = \"2186", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETPASTECONVERTENDINGS, Type = Double, Dynamic = False, Default = \"2467", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETPRINTCOLOURMODE, Type = Double, Dynamic = False, Default = \"2148", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETPRINTMAGNIFICATION, Type = Double, Dynamic = False, Default = \"2146", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETPRINTWRAPMODE, Type = Double, Dynamic = False, Default = \"2406", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETPROPERTY, Type = Double, Dynamic = False, Default = \"4004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETREADONLY, Type = Double, Dynamic = False, Default = \"2171", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETREPRESENTATION, Type = Double, Dynamic = False, Default = \"2665", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSAVEPOINT, Type = Double, Dynamic = False, Default = \"2014", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSEARCHFLAGS, Type = Double, Dynamic = False, Default = \"2198", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONEND, Type = Double, Dynamic = False, Default = \"2144", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONEND1, Type = Double, Dynamic = False, Default = \"2144", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONMODE, Type = Double, Dynamic = False, Default = \"2422", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONNANCHOR, Type = Double, Dynamic = False, Default = \"2578", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONNCARET, Type = Double, Dynamic = False, Default = \"2576", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSELECTIONSTART, Type = Double, Dynamic = False, Default = \"2142", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSTATUS, Type = Double, Dynamic = False, Default = \"2382", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETSTYLING, Type = Double, Dynamic = False, Default = \"2033", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETTARGETEND, Type = Double, Dynamic = False, Default = \"2192", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETTARGETSTART, Type = Double, Dynamic = False, Default = \"2190", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETTEXT, Type = Double, Dynamic = False, Default = \"2181", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETUNDOCOLLECTION, Type = Double, Dynamic = False, Default = \"2012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETVIEWEOL, Type = Double, Dynamic = False, Default = \"2356", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETVSCROLLBAR, Type = Double, Dynamic = False, Default = \"2280", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETWRAPMODE, Type = Double, Dynamic = False, Default = \"2268", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETXCARETPOLICY, Type = Double, Dynamic = False, Default = \"2402", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETYCARETPOLICY, Type = Double, Dynamic = False, Default = \"2403", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SETZOOM, Type = Double, Dynamic = False, Default = \"2373", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STARTRECORD, Type = Double, Dynamic = False, Default = \"3001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STARTSTYLING, Type = Double, Dynamic = False, Default = \"2032", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STOPRECORD, Type = Double, Dynamic = False, Default = \"3002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STUTTEREDPAGEDOWN, Type = Double, Dynamic = False, Default = \"2437", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STUTTEREDPAGEDOWNEXTEND, Type = Double, Dynamic = False, Default = \"2438", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STUTTEREDPAGEUP, Type = Double, Dynamic = False, Default = \"2435", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STUTTEREDPAGEUPEXTEND, Type = Double, Dynamic = False, Default = \"2436", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETBACK, Type = Double, Dynamic = False, Default = \"2482", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETBOLD, Type = Double, Dynamic = False, Default = \"2483", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETFONT, Type = Double, Dynamic = False, Default = \"2486", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETFORE, Type = Double, Dynamic = False, Default = \"2481", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETHOTSPOT, Type = Double, Dynamic = False, Default = \"2493", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETITALIC, Type = Double, Dynamic = False, Default = \"2484", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETSIZE, Type = Double, Dynamic = False, Default = \"2485", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETSIZEFRACTIONAL, Type = Double, Dynamic = False, Default = \"2062", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLEGETUNDERLINE, Type = Double, Dynamic = False, Default = \"2488", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETBACK, Type = Double, Dynamic = False, Default = \"2052", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETBOLD, Type = Double, Dynamic = False, Default = \"2053", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETFONT, Type = Double, Dynamic = False, Default = \"2056", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETFORE, Type = Double, Dynamic = False, Default = \"2051", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETHOTSPOT, Type = Double, Dynamic = False, Default = \"2409", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETITALIC, Type = Double, Dynamic = False, Default = \"2054", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETSIZE, Type = Double, Dynamic = False, Default = \"2055", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETSIZEFRACTIONAL, Type = Double, Dynamic = False, Default = \"2061", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLESETUNDERLINE, Type = Double, Dynamic = False, Default = \"2059", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TAB, Type = Double, Dynamic = False, Default = \"2327", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TARGETFROMSELECTION, Type = Double, Dynamic = False, Default = \"2287", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TEXTHEIGHT, Type = Double, Dynamic = False, Default = \"2279", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UNDO, Type = Double, Dynamic = False, Default = \"2176", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UPPERCASE, Type = Double, Dynamic = False, Default = \"2341", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = USEPOPUP, Type = Double, Dynamic = False, Default = \"2371", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VCHOME, Type = Double, Dynamic = False, Default = \"2331", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VCHOMEEXTEND, Type = Double, Dynamic = False, Default = \"2332", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VCHOMERECTEXTEND, Type = Double, Dynamic = False, Default = \"2431", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VCHOMEWRAP, Type = Double, Dynamic = False, Default = \"2453", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VCHOMEWRAPEXTEND, Type = Double, Dynamic = False, Default = \"2454", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VERTICALCENTRECARET, Type = Double, Dynamic = False, Default = \"2619", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDLEFT, Type = Double, Dynamic = False, Default = \"2308", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDLEFTEND, Type = Double, Dynamic = False, Default = \"2439", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDLEFTENDEXTEND, Type = Double, Dynamic = False, Default = \"2440", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDLEFTEXTEND, Type = Double, Dynamic = False, Default = \"2309", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDPARTLEFT, Type = Double, Dynamic = False, Default = \"2390", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDPARTLEFTEXTEND, Type = Double, Dynamic = False, Default = \"2391", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDPARTRIGHT, Type = Double, Dynamic = False, Default = \"2392", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDPARTRIGHTEXTEND, Type = Double, Dynamic = False, Default = \"2393", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDRIGHT, Type = Double, Dynamic = False, Default = \"2310", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDRIGHTEND, Type = Double, Dynamic = False, Default = \"2441", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDRIGHTENDEXTEND, Type = Double, Dynamic = False, Default = \"2442", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WORDRIGHTEXTEND, Type = Double, Dynamic = False, Default = \"2311", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ZOOMIN, Type = Double, Dynamic = False, Default = \"2333", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ZOOMOUT, Type = Double, Dynamic = False, Default = \"2334", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
