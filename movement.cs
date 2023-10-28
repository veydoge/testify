using Godot;
using System;

public partial class movement : CharacterBody2D
{
	public const float Speed = 300.0f;
	public const float JumpVelocity = -400.0f;
	AnimatedSprite2D animatedSprite;
	[Export] public Resource inventory;

	// Get the gravity from the project settings to be synced with RigidBody nodes.
	public float gravity = ProjectSettings.GetSetting("physics/2d/default_gravity").AsSingle();
	public override void _Ready()
	{
		animatedSprite = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
	}
	public override void _Process(double delta)
	{
		if (Velocity.X == 0)
		{
			animatedSprite.Play("idle");
		}
	}

	public override void _PhysicsProcess(double delta)
	{
		Vector2 velocity = Velocity;

		// Add the gravity.
		//if (!IsOnFloor())
		//	velocity.Y += gravity * (float)delta;

		// Handle Jump.
		if (Input.IsActionJustPressed("ui_accept") && IsOnFloor())
			velocity.Y = JumpVelocity;

		// Get the input direction and handle the movement/deceleration.
		// As good practice, you should replace UI actions with custom gameplay actions.
		Vector2 direction = Input.GetVector("leftmove", "rightmove", "upmove", "downmove" +
			"" +
			"" +
			"" +
			"" +
			"" +
			"" +
			"" +
			"");
		if (direction != Vector2.Zero)
		{
			velocity.X = direction.X * Speed;
			velocity.Y = direction.Y * Speed;
			if (velocity.X < 0)
			{
				animatedSprite.Play("going_left");
                this.animatedSprite.FlipH = false;
            }
			if (velocity.X > 0)
			{
				animatedSprite.Play("going_left");	
			this.animatedSprite.FlipH = true;
			
			}
	
		}
		else
		{
			velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
			velocity.Y = Mathf.MoveToward(Velocity.Y, 0, Speed);
		} 
		Velocity = velocity;
		// LookAt(GetGlobalMousePosition());
		MoveAndSlide();
	}
}
