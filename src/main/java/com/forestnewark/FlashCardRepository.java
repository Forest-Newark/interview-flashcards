package com.forestnewark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

/**
 * Created by forestnewark on 4/12/17.
 */
@Component
public class FlashCardRepository {


    final
    JdbcTemplate template;

    @Autowired
    public FlashCardRepository(JdbcTemplate template) {
        this.template = template;
    }

    public FlashCard getFlashCardRandom() {
            return template.queryForObject(
                    "SELECT * FROM flashcards ORDER BY random() LIMIT 1",
                    new Object[]{},
                    (rs, i) -> new FlashCard(
                            rs.getInt("flashcardid"),
                            rs.getString("question"),
                            rs.getString("answer")

                    ));

    }


    public FlashCard getFlashCard(Integer cardId) {
        return template.queryForObject(
                "SELECT * FROM flashcards WHERE flashcardid = ?",
                new Object[]{cardId},
                (rs, i) -> new FlashCard(
                        rs.getInt("flashcardid"),
                        rs.getString("question"),
                        rs.getString("answer")

                ));

    }

    public int getCount(){
        String sql = "SELECT COUNT(*) FROM flashcards";
        return template.queryForObject(sql, new Object[] {}, Integer.class);

    }


    public void insertFlashCard(FlashCard flashcard){
        template.update(
                "INSERT INTO flashcards " +
                        "(question, " +
                        "answer) " +
                        "VALUES (?,?)",
                flashcard.getQuestion(),
                flashcard.getAnswer());

    }

}
