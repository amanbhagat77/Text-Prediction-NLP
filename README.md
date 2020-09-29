# Text-Prediction-App-NLP

# Overview

This project aims to build a product which can predict the next word as we start typing the words.
In this capstone we will be applying data science in the area of natural language processing. This project includes Natural Language Processing, Text Mining, and the associated tools in R. The prediction is based on the words present in the database on which the model is trained. Maximum Likelihood estimator with Kneyser Ney Smoothing has been used as the prediction model. This is a very simple version of Kneyser Ney smoothing based on certain assumptions made on the discount value. Here are some resources

[Natural language processing](https://en.wikipedia.org/wiki/Natural_language_processing)      
[Text mining infrastucture in R](http://www.jstatsoft.org/v25/i05/)        
[CRAN Task View: Natural Language Processing](http://cran.r-project.org/web/views/NaturalLanguageProcessing.html)    
[Language Modelling by Dan Jurafsky](http://web.stanford.edu/class/cs124/lec/languagemodeling.pdf)  
[Kneyser Kney Smoothing](https://en.wikipedia.org/wiki/Kneser%E2%80%93Ney_smoothing)

# Dataset

This is the training data to get you started that will be the basis for most of the capstone. You must download the data from the Coursera site and not from external websites to start.

[Capstone Dataset](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)

# Prediction Model

Kneser-Ney smoothing is an algorithm designed to adjust the weights (through discounting) by using the continuation counts of lower n-grams. The concept is fairly simple though a bit more difficult to implement in a program.

Given the sentence, “Francisco”" is presented as the suggested ending, because it appears more often than “glasses” in some text.

I can’t see without my reading… __ Francisco __

However, even though “Francisco” appears more often than “glasses”, “Francisco” rarely occurs outside of the context of “San Francisco”. Thus, instead of observing how often a word appears, the Kneser-Ney algorithm takes into account how often a word completes a bigram type (e.g., “prescription glasses”, “reading glasses”, “small glasses” vs. “San Francisco”). This example was taken from Jurafsky’s video lecture on Kneser-Ney Smoothing, which also describes the equation used to calculate the Kneser-Ney probability. https://www.youtube.com/watch?v=wtB00EczoCM

I believe that typically, the smoothing algorithm is performed on all of the n-grams (unigram models, bigram models, etc.) prior to attempting any predictions. However, given the restraint of computing time, I only had enough time to create a version which performs the smoothing when a user provides an input.

## Current State of the Project

I have conducted the exploratory analysis for this project. Here is [the link](https://rpubs.com/amanbhagat77/ExpAnalysis) to the analysis report.     

An Early Build of the application is ready. You can be accessed it by clicking on the following link.

[Text Prediction App](https://amanbhagat.shinyapps.io/Text-Prediction-NLP/)
