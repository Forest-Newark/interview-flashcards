package com.forestnewark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.ArrayList;
/**
 * Created by forestnewark on 4/12/17.
 */
@Controller
public class FlashCardController {

    private int currentCardId = 0;

   ArrayList<FlashCard> markedQuestions;

    final
    FlashCardRepository repo;

    @Autowired
    public FlashCardController(FlashCardRepository repo) {
        this.repo = repo;
        this.markedQuestions = new ArrayList<>();
    }



    @RequestMapping("/")
    public String index(Model model){
        model.addAttribute("cardCountTotal",repo.getCount());
        model.addAttribute("question","Click Next Card to Get Started");
        return "flashcards";

    }

    @RequestMapping("/nextCard")
    public String nextCard(Model model){
        FlashCard flashCard = repo.getFlashCardRandom();
        currentCardId = flashCard.getId();
        model.addAttribute("cardCountTotal",repo.getCount());
        model.addAttribute("question",flashCard.getQuestion());
        model.addAttribute("markedQuestions",markedQuestions);
        return "flashcards";
    }

    @RequestMapping("/showAnswer")
    public String showAnswer(Model model){
        model.addAttribute("cardCountTotal",repo.getCount());
        model.addAttribute("markedQuestions",markedQuestions);

        if(currentCardId != 0){
        model.addAttribute("question",repo.getFlashCard(currentCardId).getQuestion());
        model.addAttribute("answer",repo.getFlashCard(currentCardId).getAnswer());}
        return "flashcards";
    }

    @RequestMapping("/markQuestion")
    public String addMarkedQuestion(Model model){
        if(currentCardId != 0){
            markedQuestions.add(repo.getFlashCard(currentCardId));
        }
        return showAnswer(model);
    }


    @RequestMapping("/addQuestion")
    public String addQuestion(){
        return "addQuestion";

    }
    @RequestMapping(value="/addQuestionToRepo")
    public String addQuestionToRepo(Model model, FlashCard flashCard) {
        repo.insertFlashCard(flashCard);
        model.addAttribute("cardCountTotal",repo.getCount());
        if(currentCardId != 0){
            model.addAttribute("question",repo.getFlashCard(currentCardId).getQuestion());
        }
        model.addAttribute("markedQuestions",markedQuestions);
        return "flashcards";

    }

}
