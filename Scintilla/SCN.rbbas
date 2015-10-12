#tag Module
Protected Module SCN
	#tag Method, Flags = &h1
		Protected Function GetNotificationName(NotifyID As Integer) As String
		  If mNames = Nil Then
		    mNames = New Dictionary(_
		    2000:"SCN_STYLENEEDED", 2001:"SCN_CHARADDED", 2002:"SCN_SAVEPOINTREACHED", 2003:"SCN_SAVEPOINTLEFT", 2004:"SCN_MODIFYATTEMPTRO", _
		    2005:"SCN_KEY", 2006:"SCN_DOUBLECLICK", 2007:"SCN_UPDATEUI", 2008:"SCN_MODIFIED", 2009:"SCN_MACRORECORD", 2010:"SCN_MARGINCLICK", _
		    2011:"SCN_NEEDSHOWN", 2013:"SCN_PAINTED", 2014:"SCN_USERLISTSELECTION", 2015:"SCN_URIDROPPED", 2016:"SCN_DWELLSTART", 2017:"SCN_DWELLEND", _
		    2018:"SCN_ZOOM", 2019:"SCN_HOTSPOTCLICK", 2020:"SCN_HOTSPOTDOUBLECLICK", 2021:"SCN_CALLTIPCLICK", 2022:"SCN_AUTOCSELECTION", _
		    2023:"SCN_INDICATORCLICK", 2024:"SCN_INDICATORRELEASE", 2025:"SCN_AUTOCCANCELLED", 2026:"SCN_AUTOCCHARDELETED", 2027:"SCN_HOTSPOTRELEASECLICK")
		  End If
		  
		  Return mNames.Lookup(NotifyID, "Undefined")
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mNames As Dictionary
	#tag EndProperty


	#tag Constant, Name = AUTOCCANCELLED, Type = Double, Dynamic = False, Default = \"2025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCCHARDELETED, Type = Double, Dynamic = False, Default = \"2026", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOCSELECTION, Type = Double, Dynamic = False, Default = \"2022", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CALLTIPCLICK, Type = Double, Dynamic = False, Default = \"2021", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHARADDED, Type = Double, Dynamic = False, Default = \"2001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DWELLEND, Type = Double, Dynamic = False, Default = \"2017", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DWELLSTART, Type = Double, Dynamic = False, Default = \"2016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOTSPOTCLICK, Type = Double, Dynamic = False, Default = \"2019", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOTSPOTDOUBLECLICK, Type = Double, Dynamic = False, Default = \"2020", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HOTSPOTRELEASECLICK, Type = Double, Dynamic = False, Default = \"2027", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MACRORECORD, Type = Double, Dynamic = False, Default = \"2009", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MARGINCLICK, Type = Double, Dynamic = False, Default = \"2010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MODIFIED, Type = Double, Dynamic = False, Default = \"2008", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PAINTED, Type = Double, Dynamic = False, Default = \"2013", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SAVEPOINTLEFT, Type = Double, Dynamic = False, Default = \"2003", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SAVEPOINTREACHED, Type = Double, Dynamic = False, Default = \"2002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = STYLENEEDED, Type = Double, Dynamic = False, Default = \"2000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UPDATEUI, Type = Double, Dynamic = False, Default = \"2007", Scope = Protected
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
