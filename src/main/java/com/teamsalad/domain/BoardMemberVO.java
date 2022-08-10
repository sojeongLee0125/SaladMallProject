package com.teamsalad.domain;

public class BoardMemberVO {
	
	private memberVO member;
	private recipeBoardVO board;
	private recipeVO recipe;
	
	public memberVO getMember() {
		return member;
	}
	public void setMember(memberVO member) {
		this.member = member;
	}
	public recipeBoardVO getBoard() {
		return board;
	}
	public void setBoard(recipeBoardVO board) {
		this.board = board;
	}
	public recipeVO getRecipe() {
		return recipe;
	}
	public void setRecipe(recipeVO recipe) {
		this.recipe = recipe;
	}
	
	@Override
	public String toString() {
		return "BoardMemberVO [member=" + member + ", board=" + board + ", recipe=" + recipe + "]";
	}
}
