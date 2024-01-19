using Godot;
using System;

public partial class Camera2D : Godot.Camera2D
{
	private CharacterBody2D characterBody2D;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		
		characterBody2D = GetParent<Node2D>().GetNode<CharacterBody2D>("player");
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		Vector2 vector2 = new Vector2(characterBody2D.Position.X, characterBody2D.Position.Y);
		this.Position = vector2;
	}
}
