#tag Class
Protected Class History
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub ActionBegin()
		  ' Call this method before a compound action that should be treated as a single undo/redo event.
		  ' Call ActionEnd to mark the end of the event.
		  Call Me.SendMessage(Scintilla.SCI.BEGINUNDOACTION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActionEnd()
		  Call Me.SendMessage(Scintilla.SCI.ENDUNDOACTION)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddUndoAction(Tag As Integer, MayCoalesce As Boolean)
		  ' Adds an undoable action without modifying the document. Tag is an integer that will be passed to the ScintillaEditor.PerformUndo/Redo
		  ' events when these custom action should be un/redone. This is only for actions which do not affect the document state but should be counted
		  ' as un/redoable (e.g. toggling a bookmark.)
		  ' Undo/redo actions added via this method DO affect ScintillaEditor.Dirty and ScintillaEditor.SavePointReached/SavePointLeft.
		  ' If MayCoalesce=True, the action being added MAY be coalesced with an adjacent document action.
		  ' See: http://www.scintilla.org/ScintillaDoc.html#Scintilla.SCI.ADDUNDOACTION
		  
		  Call Me.SendMessage(Scintilla.SCI.ADDUNDOACTION, Tag, MayCoalesce)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanRedo() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.CANREDO) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanUndo() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.CANUNDO) = 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Redo() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.REDO) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Undo() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.UNDO) = 0
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' If True (default), Scintilla collects undo/redo actions
			  Return Me.SendMessage(Scintilla.SCI.GETUNDOCOLLECTION) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETUNDOCOLLECTION, value, 0)
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
