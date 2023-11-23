package toDo.task;

import java.sql.Date;

import toDo.user.User;

public class Task {
	private int taskId;
	private String title;
	private String description;
	private Date dueDate;
	private boolean completed;
	private String completedString;
	private User user_id;
	
	@Override
    public String toString() {
        return "Task{" +
                "taskId=" + taskId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", dueDate=" + dueDate +
                ", completed=" + completed +
                ", completedString='" + completedString + '\'' +
                ", user_id=" + user_id +
                '}';
    }
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int id) {
		this.taskId = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String desciption) {
		this.description = desciption;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public boolean getCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	public User getUser_id() {
		return user_id;
	}
	public void setUser_id(User user_id) {
		this.user_id = user_id;
	}
	
	public String getCompletedString() {
        return completedString;
    }

    public void setCompletedString(String completedString) {
        this.completedString = completedString;
    }
	
	

}
