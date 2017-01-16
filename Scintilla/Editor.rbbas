#tag Class
Protected Class Editor
	#tag Method, Flags = &h1
		Protected Sub Constructor(ParentWindow As Integer, Left As Integer, Top As Integer, Width As Integer, Height As Integer)
		  ' Calling Scintilla.IsAvailable loads the Scintilla library, which in turn
		  ' registers a window class named "Scintilla". 
		  If Not Scintilla.IsAvailable Then Raise New PlatformNotSupportedException
		  Const Scintilla_WndClass = "Scintilla"
		  
		  ' create a new control of the Scintilla window class
		  mHandle = CreateWindowExA(WS_EX_CONTROLPARENT, Scintilla_WndClass, "", _
		  WS_CHILD Or WS_CLIPCHILDREN Or WS_TABSTOP Or WS_VISIBLE, Left, Top, Width, Height, _
		  ParentWindow, 0, 0, Nil)
		  
		  If mHandle = 0 Then Raise New ScintillaException(GetLastError, False)
		  
		  ' Set the parent window
		  Call SetParent(mHandle, ParentWindow)
		  
		  ' Now subclass the parent window so we can receive its window messages
		  If WndProcs = Nil Then WndProcs = New Dictionary
		  Dim d As New Dictionary
		  If Not WndProcs.HasKey(ParentWindow) Then
		    WndProcs.Value(ParentWindow) = SetWindowLongA(ParentWindow, GWL_WNDPROC, AddressOf DefWindowProc)
		  End If
		  d.Value(ParentWindow) = New WeakRef(Me)
		  Subclasses.Append(d)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentWindow As RectControl, Left As Integer, Top As Integer, Width As Integer, Height As Integer)
		  Me.Constructor(ParentWindow.Handle, Left, Top, Width, Height)
		  mParent = New WeakRef(ParentWindow)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentWindow As Window, Left As Integer, Top As Integer, Width As Integer, Height As Integer)
		  Me.Constructor(ParentWindow.Handle, Left, Top, Width, Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DefWindowProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr) As Integer
		  #pragma X86CallingConvention StdCall
		  For i As Integer = UBound(Subclasses) DownTo 0
		    Dim wndclass As Dictionary = Subclasses(i)
		    ' Find the instance that belongs to HWND
		    If wndclass.HasKey(HWND) Then
		      Dim subclass As WeakRef = wndclass.Lookup(HWND, Nil)
		      If subclass = Nil Or subclass.Value = Nil Then Continue
		      Dim RetValue As Integer
		      Try
		        If subclass.Value IsA Editor And Editor(subclass.Value).WndProc(HWND, msg, wParam, lParam, RetValue) Then
		          ' subclass handled the message
		          Return RetValue
		        End If
		      Catch Err As RuntimeException
		        If Err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		        Break
		        Continue ' Subclass had an exception and didn't handle it!
		      End Try
		    End If
		  Next
		  
		  ' No one handled this message, pass it to the next WndProc
		  Dim nextWndProc As Integer = WndProcs.Lookup(HWND, 0)
		  If nextWndProc <> 0 Then
		    Return CallWindowProcA(nextWndProc, HWND, msg, wParam, lParam)
		  Else
		    ' There is no next WndProc. This should never happen!
		    Break
		    System.DebugLog(App.ExecutableFile.Name + ": HWND(0x" + Hex(HWND) + ") No WndProc to call!")
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  For i As Integer = UBound(Subclasses) DownTo 0
		    Dim wndclass As Dictionary = Subclasses(i)
		    Dim subclass As WeakRef = wndclass.Lookup(mHandle, Nil)
		    If subclass <> Nil And subclass.Value <> Nil And subclass.Value Is Me Then
		      wndclass.Remove(mHandle)
		    End If
		  Next
		  
		  For i As Integer = UBound(Subclasses) DownTo 0
		    Dim wndclass As Dictionary = Subclasses(i)
		    If wndclass.HasKey(mHandle) Then Return ' More Subclasses still exist
		  Next
		  
		  If Not WndProcs.HasKey(mHandle) Then Return
		  Dim oldWndProc As Ptr = WndProcs.Value(mHandle)
		  Call SetWindowLongA(mHandle, GWL_WNDPROC, oldWndProc)
		  WndProcs.Remove(mHandle)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parent() As Scintilla.EditControl
		  If mParent <> Nil And mParent.Value <> Nil And mParent.Value IsA Scintilla.EditControl Then return Scintilla.EditControl(mParent.Value)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function Scintilla_Direct(DirectPtr As Ptr, Msg As Integer, WParam As Ptr, LParam As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function SendMessage(Msg As Integer, WParam As Ptr, LParam As Ptr, DirectMessage As Boolean = False) As Integer
		  If DirectMessage Then ' Invoke the Scintilla routine directly
		    Return DirectFn.Invoke(DirectPtr, Msg, WParam, LParam)
		  Else ' Normal messaging
		    Return SendMessageA(mHandle, Msg, WParam, LParam)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WndProc(HWND as Integer, msg as Integer, wParam as Ptr, lParam as Ptr, ByRef RetValue As Integer) As Boolean
		  #pragma Unused RetValue
		  #pragma Unused HWND
		  #pragma Unused wParam
		  
		  Dim notification As SCNotification
		  Select Case msg
		  Case WM_NOTIFY
		    notification = lparam.SCNotification
		    RaiseEvent ScintillaEvent(Notification.Code, Notification)
		    Return True
		  Case WM_SIZE
		    RaiseEvent ScintillaEvent(msg, notification)
		    'Else
		    ''Case WM_DROPFILES
		    'System.DebugLog("Window message: &h" + Hex(msg))
		  End Select
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ScintillaEvent(EventCode As Integer, Notification As Scintilla.SCNotification)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim currentdoc As Integer = Me.SendMessage(Scintilla.SCI.GETDOCPOINTER, Nil, Nil)
			  Return New Scintilla.Document(Me, Ptr(currentdoc))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETDOCPOINTER, Nil, value.Handle)
			End Set
		#tag EndSetter
		CurrentDocument As Scintilla.Document
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mDirectFn = Nil Then
			    Dim i As Integer = SendMessageA(mHandle, Scintilla.SCI.GETDIRECTFUNCTION, Nil, Nil)
			    If i = 0 Then Raise New RuntimeException'ScintillaException(GetLastError, False)
			    mDirectFn = New Scintilla_Direct(Ptr(i))
			  End If
			  Return mDirectFn
			End Get
		#tag EndGetter
		Protected DirectFn As Scintilla_Direct
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mDirectPtr = Nil Then
			    Dim pt As Integer = SendMessageA(mHandle, Scintilla.SCI.GETDIRECTPOINTER, Nil, Nil)
			    If pt = 0 Then Raise New RuntimeException'ScintillaException(GetLastError, False)
			    mDirectPtr = Ptr(pt)
			  End If
			  Return mDirectPtr
			End Get
		#tag EndGetter
		Protected DirectPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call EnableWindow(mHandle, value)
			  mEnabled = value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDirectFn As Scintilla_Direct
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDirectPtr As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParent As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Subclasses() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared WndProcs As Dictionary
	#tag EndProperty


	#tag Constant, Name = GWL_WNDPROC, Type = Double, Dynamic = False, Default = \"-4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_NOTIFY, Type = Double, Dynamic = False, Default = \"&h004E", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CHILD, Type = Double, Dynamic = False, Default = \"&h40000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_CLIPCHILDREN, Type = Double, Dynamic = False, Default = \"&h02000000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_EX_CONTROLPARENT, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_TABSTOP, Type = Double, Dynamic = False, Default = \"&h00010000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WS_VISIBLE, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Private
	#tag EndConstant


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
