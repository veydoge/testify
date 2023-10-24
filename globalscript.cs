using Godot;
using Godot.Collections;
using System;

public partial class globalscript : Node
{
	// Called when the node enters the scene tree for the first time.
	public Dictionary dict;
	public override void _Ready()
	{
		Variant variant = JSON_read("res://assets/items.json");
		dict = variant.AsGodotDictionary();
		foreach(string key in dict.Keys)
		{
			dict[key] = new Dictionary<string, string>();
			dict[key].AsGodotDictionary()["key"] = key;
		}
		GD.Print(dict);
		GD.Print(get_item_key("sword"));
	}

	public Variant get_item_key(string key)
	{

		return dict[key].AsGodotDictionary();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{

	}

	public Variant JSON_read(string path)
	{
        
        Godot.FileAccess file = FileAccess.Open(path, FileAccess.ModeFlags.Read);
		var json = Json.ParseString(file.GetAsText());
		file.Close();
		return json;
	}
}
