package com.igeek.carsys.entity;

/**
 * @Description 常见问题实体类
 * @Author Lemon
 * @Date 2021/2/16 1:56
 */
public class Problem {
    //问题编号
    private Integer problem_id;
    //问题分类
    private String problem_category;
    //问题标题
    private String problem_title;
    //问题内容
    private String problem;


    public Problem() {
    }

    public Problem(Integer problem_id, String problem_category, String problem_title, String problem) {
        this.problem_id = problem_id;
        this.problem_category = problem_category;
        this.problem_title = problem_title;
        this.problem = problem;
    }

    /**
     * 获取
     * @return problem_id
     */
    public Integer getProblem_id() {
        return problem_id;
    }

    /**
     * 设置
     * @param problem_id
     */
    public void setProblem_id(Integer problem_id) {
        this.problem_id = problem_id;
    }

    /**
     * 获取
     * @return problem_category
     */
    public String getProblem_category() {
        return problem_category;
    }

    /**
     * 设置
     * @param problem_category
     */
    public void setProblem_category(String problem_category) {
        this.problem_category = problem_category;
    }

    /**
     * 获取
     * @return problem_title
     */
    public String getProblem_title() {
        return problem_title;
    }

    /**
     * 设置
     * @param problem_title
     */
    public void setProblem_title(String problem_title) {
        this.problem_title = problem_title;
    }

    /**
     * 获取
     * @return problem
     */
    public String getProblem() {
        return problem;
    }

    /**
     * 设置
     * @param problem
     */
    public void setProblem(String problem) {
        this.problem = problem;
    }

    public String toString() {
        return "Problem{problem_id = " + problem_id + ", problem_category = " + problem_category + ", problem_title = " + problem_title + ", problem = " + problem + "}";
    }
}
