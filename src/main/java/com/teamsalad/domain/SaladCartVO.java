package com.teamsalad.domain;

public class SaladCartVO {
	private cartVO cart;
	private recipeVO recipe;
	
	public cartVO getCart() {
		return cart;
	}
	public void setCart(cartVO cart) {
		this.cart = cart;
	}
	public recipeVO getRecipe() {
		return recipe;
	}
	public void setRecipe(recipeVO recipe) {
		this.recipe = recipe;
	}
	@Override
	public String toString() {
		return "SaladCartVO [cart=" + cart + ", recipe=" + recipe + "]";
	}
}