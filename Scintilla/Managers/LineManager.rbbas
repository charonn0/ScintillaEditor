#tag Class
Protected Class LineManager
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function AddMarker(LineNumber As Integer, MarkerNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.MARKERADD, LineNumber, MarkerNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllMarkersByHandle(MarkerHandle As Integer)
		  Call Me.SendMessage(Scintilla.SCI.MARKERDELETEHANDLE, MarkerHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllMarkersByNumber(MarkerNumber As Integer)
		  Call Me.SendMessage(Scintilla.SCI.MARKERDELETE, MarkerNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearMarker(LineNumber As Integer, MarkerNumber As Integer)
		  Call Me.SendMessage(Scintilla.SCI.MARKERDELETE, LineNumber, MarkerNumber)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return Me.SendMessage(Scintilla.SCI.GETLINECOUNT)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Current() As Integer
		  Dim mb As New MemoryBlock(2)
		  Dim i As Integer = Me.SendMessage(Scintilla.SCI.GETCURLINE, mb, 1)
		  Return Me.FromPosition(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EndPosition(LineNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.GETLINEENDPOSITION, LineNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FromMarker(MarkerHandle As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.MARKERLINEFROMHANDLE, MarkerHandle)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FromPosition(Position As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.LINEFROMPOSITION, Position)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Length(LineNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.LINELENGTH, LineNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartPosition(LineNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.POSITIONFROMLINE, LineNumber, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function State(LineNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.GETLINESTATE, LineNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub State(LineNumber As Integer, Assigns NewState As Integer)
		  Call Me.SendMessage(Scintilla.SCI.SETLINESTATE, LineNumber, NewState)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text(LineNumber As Integer) As String
		  Dim len As Integer = Me.SendMessage(Scintilla.SCI.LINELENGTH, LineNumber, 0)
		  Dim mb As New MemoryBlock(len + 1)
		  Call Me.SendMessage(Scintilla.SCI.GETLINE, LineNumber, mb)
		  Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextHeight(LineNumber As Integer) As Integer
		  Return Me.SendMessage(Scintilla.SCI.TEXTHEIGHT, LineNumber)
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			Extra space above each line.
			
			See: http://www.scintilla.org/ScintillaDoc.html#Scintilla.SCI.GETEXTRAASCENT
		#tag EndNote
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETEXTRAASCENT)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETEXTRAASCENT, value)
			  
			  
			End Set
		#tag EndSetter
		ExtraAscent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			Extra space below each line.
			
			See: http://www.scintilla.org/ScintillaDoc.html#Scintilla.SCI.GETEXTRAASCENT
		#tag EndNote
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETEXTRADESCENT)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETEXTRADESCENT, value)
			  
			  
			End Set
		#tag EndSetter
		ExtraDescent As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETFIRSTVISIBLELINE)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETFIRSTVISIBLELINE, value)
			  
			  
			End Set
		#tag EndSetter
		TopLine As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ExtraAscent"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExtraDescent"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="TopLine"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
