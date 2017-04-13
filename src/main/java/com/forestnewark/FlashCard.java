package com.forestnewark;

import org.springframework.stereotype.Component;

/**
 * Created by forestnewark on 4/12/17.
 */

public class FlashCard {

    private Integer id;
    private String question;
    private String answer;

    public FlashCard(){}

    public FlashCard(Integer id, String question, String answer) {
        this.id = id;
        this.question = question;
        this.answer = answer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
