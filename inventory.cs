using Godot;
using System;
using System.Collections.Generic;
using System.Data;

public partial class inventory : Node
{
	[Signal]
	public delegate void items_changedEventHandler(int[] indexes);
	int cols;
	int rows;
	int slots;
	List<string> items;
	public inventory()
	{
		cols = 9;
		rows = 3;
		slots = cols * rows;
		
	}
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
