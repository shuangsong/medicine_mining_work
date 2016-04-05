
def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.
    Starts up an interactive game of Hangman.
    * At the start of the game, let the user know how many 
      letters the secretWord contains.
    * Ask the user to supply one guess (i.e. letter) per round.
    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computers word.
    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.
    Follows the other limitations detailed in the problem write-up.
    '''
    # FILL IN YOUR CODE HERE...
    print "Welcome to the game Hangman!"
    print "I am thinking of a word that is", len(secretWord), "letters long."
    print "-------------"
    lettersGuessed = []
    mistakesMade = 0
    availableLetters = string.ascii_lowercase

    while mistakesMade < 8 and not isWordGuessed(secretWord, lettersGuessed):
        print "You have", 8 - mistakesMade, "guesses left."
        print "Available letters:", availableLetters
        guess = raw_input("Please guess a letter: ").lower()

        if guess in lettersGuessed:
            print("Oops! You've already guessed that letter: " +
                getGuessedWord(secretWord, lettersGuessed))
        elif guess in secretWord:
            lettersGuessed.append(guess)
            print "Good guess:", getGuessedWord(secretWord, lettersGuessed)
        else:
            mistakesMade += 1
            lettersGuessed.append(guess)
            print("Oops! That letter is not in my word: " + 
                getGuessedWord(secretWord, lettersGuessed))

        availableLetters = getAvailableLetters(lettersGuessed)

        print "------------"

    if isWordGuessed(secretWord, lettersGuessed):
        print "Congratulations, you won!"
    else:
        print("Sorry, you ran out of guesses. The word was " + secretWord + 
            ".")
