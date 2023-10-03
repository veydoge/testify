using Godot;
using System;

public partial class globalscript : Node
{
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		Variant variant = JSON_read("res://assets/items.json");
		foreach(var item in variant.AsGodotDictionary())
		{
			GD.Print(item);
		}
	
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

	}

	public Variant JSON_read(string path)
	{
        GD.Print("123");
        Godot.FileAccess file = FileAccess.Open(path, FileAccess.ModeFlags.Read);
		var json = Json.ParseString(file.GetAsText());
	
		GD.Print(file.GetAsText());
		file.Close();
		return json;
	}
}
