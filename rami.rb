#!/usr/bin/env ruby
# encoding: UTF-8

# Post-creation modifications:
# ɑ ɛ i u are the basic vowels, and can appear in closed syllables, others can't
# æ > ɑ
# ø > u
# ɤ > ɑ
# o > u
# Consonant assimilation

def form_roots(num=3, form=:root)
  case form
  when :root
	  num.times do |num|
 	  	puts "%d: %s" % [num.next, form_root]
 		end
 	when :inflection
	  num.times do |num|
 	  	puts "%d: %s" % [num.next, form_inflect]
 		end
 	else
 		puts "Didn't recognize argument \"#{form}\"."
 	end
end

def form_inflect
  inflect = ""
  num = rand(3)+1

  num.times do
    inflect << tone
  end
  
  inflect
end

def form_root(shape = nil, shape_two = nil)  
  root = ""
  root << first_S_consonant if rand(100) < 10
  root << first_C_consonant 
	root << first_X_consonant if rand(100) < 35
  root << first_vowel
  root << tone 
  if rand(100) < 97
    root << first_S_consonant if rand(100) < 10
    root << first_C_consonant 
  	root << first_X_consonant if rand(100) < 35
    root << first_vowel
    root << tone 
    if rand(100) < 90
      root << first_S_consonant if rand(100) < 10
      root << first_C_consonant 
     	root << first_X_consonant if rand(100) < 35
      root << first_vowel
      root << tone 
      if rand(100) < 3
        root << first_S_consonant if rand(100) < 10
        root << first_C_consonant 
       	root << first_X_consonant if rand(100) < 35
        root << first_vowel
        root << tone 
      end
    end
  end
#  root << second_S_consonant if rand(100) < 25
#  root << second_C_consonant
#  root << second_X_consonant if rand(100) < 13
  root
end

def tone
	%w{+ -}.random
end

def first_X_consonant
	# Possibilities: /p b t d ʈ ɖ c ɟ k g ʔ ɸ β v θ ð s ʃ ʂ ʐ ç ʝ x ɣ h ɮ l ɫ w ɻʷ j ɾ r/
	consonant = {
	  8 => %w{β l v w ð ʐ},
	  7 => %w{p j ʝ ɣ},
	  6 => %w{ʈ c t ɾ}, 
	  5 => %w{ɸ θ k ʔ},
	  4 => %w{ɮ s ɫ ʃ ʂ ç},
	  3 => %w{b ɻʷ x h},
	  2 => %w{ɖ d r}, 
	  1 => %w{ɟ ɡ}
	}
	
	chosen = rand 369 
	case 
	when chosen < 144 then consonant[8].random
	when chosen < 233 then consonant[7].random
	when chosen < 288 then consonant[6].random
	when chosen < 322 then consonant[5].random
	when chosen < 343 then consonant[4].random
	when chosen < 356 then consonant[3].random
	when chosen < 364 then consonant[2].random
	else consonant[1].random
	end
end

def first_C_consonant
	# Possibilities: /m̥ m n̥ n ɳ̊ ɳ ɲ̊ ɲ ŋ̊ ŋ p b t d ʈ ɖ c ɟ k g ʔ ɸ β v θ ð s ʃ ʂ ʐ ç ʝ x ɣ h ɮ l ɫ w ɻʷ j ɾ r/
	consonant = {
	  9 => %w{β l v w ð ʐ},
	  8 => %w{p j ʝ ɣ},
	  7 => %w{m ʈ n c t ɾ}, 
	  6 => %w{ɸ ɳ θ k ʔ},
	  5 => %w{ɮ s ɫ ʃ ʂ ç ɲ ŋ},
	  4 => %w{b ɻʷ x h},
	  3 => %w{m̥ ɖ n̥ d r}, 
	  2 => %w{ɳ̊ ɟ ɡ},
		1 => %w{ɲ̊ ŋ̊}
	}
	
	chosen = rand 372 
	case 
	when chosen < 144 then consonant[9].random
	when chosen < 233 then consonant[8].random
	when chosen < 288 then consonant[7].random
	when chosen < 322 then consonant[6].random
	when chosen < 343 then consonant[5].random
	when chosen < 356 then consonant[4].random
	when chosen < 364 then consonant[3].random
	when chosen < 369 then consonant[2].random
	else consonant[1].random
	end
end

def first_S_consonant
	# Possibilities: /ɾ ʔ h s v ʃ l ɮ r/
	# ʔ > h v s > ɾ l > ɮ ʃ > r
  consonant = { 
    5 => %w{ʔ},
    4 => %w{h v s},
    3 => %w{ɾ l},
    2 => %w{ɮ ʃ},
    1 => %w{ɾ}
  }
  
  chosen = rand 81
  case 
  when chosen < 34 then consonant[5].random
  when chosen < 55 then consonant[4].random
  when chosen < 68 then consonant[3].random
  when chosen < 76 then consonant[2].random
  else consonant[1].random
  end
end

def first_vowel
  vowel = { 
    4 => %w{i ɑ u},
    3 => %w{ɛ o},
    2 => %w{æ ̃ɤ},
    1 => %w{ø}
  }

  chosen = rand 39
  case 
  when chosen < 12 then vowel[1].random
  when chosen < 20 then vowel[2].random
  when chosen < 29 then vowel[3].random
  else vowel[4].random
  end
end

def second_medial_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i ν δ γ λ ζ},
    3 => %w{th kh tᴥ kᴥ mᴥ nᴥ x ι ¿ q},
    2 => %w{ph pᴥ bᴥ dᴥ gᴥ ᴥ},
    1 => %w{μᴥ νᴥ h ϙ}
    # none: BQ DQ GQ 
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def second_final_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ th kh tᴥ kᴥ mᴥ nᴥ},
    3 => %w{x ι ¿ ph pᴥ bᴥ dᴥ gᴥ q},
    2 => %w{μᴥ νᴥ ᴥ},
    1 => %w{h βᴥ δᴥ γᴥ ϙ}
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def second_syllable
  syllable_shape, syllable = rand(100), ""
  
#  syllable << ":" if syllable_shape < 29
  syllable << second_vowel
  syllable << third_final_consonant if syllable_shape < 40 && syllable_shape >= 5
  syllable << third_medial_consonant if syllable_shape < 5
  syllable << third_vowel if syllable_shape < 5
  syllable
end

def second_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u},
    3 => %w{ι a},
    2 => %w{υ e o},
    1 => %w{α η à ò},
    # Out: O Ə Ɔ X
  }

  chosen = rand 39
  case 
  when chosen < 5 then vowel[1].random
  when chosen < 12 then vowel[2].random
  when chosen < 20 then vowel[3].random
  when chosen < 29 then vowel[4].random
  else vowel[5].random
  end
end

def third_medial_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ},
    3 => %w{th kh tᴥ kᴥ mᴥ nᴥ x ι ¿ q},
    2 => %w{ph pᴥ bᴥ dᴥ gᴥ ᴥ},
    1 => %w{μᴥ νᴥ h ϙ}
    # none: BQ DQ GQ 
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def third_final_consonant
  consonant = { 
    6 => %w{t k s m n},
    5 => %w{p b d g f l z μ ν},
    4 => %w{i β δ γ λ ζ th kh tᴥ kᴥ mᴥ nᴥ},
    3 => %w{x ι ¿ ph pᴥ bᴥ dᴥ gᴥ q},
    2 => %w{μᴥ νᴥ ᴥ},
    1 => %w{h βᴥ δᴥ γᴥ ϙ}
  }
  
  chosen = rand 41
  case 
  when chosen < 4 then consonant[1].random
  when chosen < 9 then consonant[2].random
  when chosen < 15 then consonant[3].random
  when chosen < 22 then consonant[4].random
  when chosen < 31 then consonant[5].random
  else consonant[6].random
  end
end

def third_vowel
  vowel = { 
    5 => %w{i},
    4 => %w{u},
    3 => %w{ι a},
    2 => %w{υ e o},
    1 => %w{α η à ò},
    # Out: O Ə Ɔ X
  }

  chosen = rand 39
  case 
  when chosen < 5 then vowel[1].random
  when chosen < 12 then vowel[2].random
  when chosen < 20 then vowel[3].random
  when chosen < 29 then vowel[4].random
  else vowel[5].random
  end
end

class Array
  def random
    self[rand length]
  end
end

form_roots ARGV[0].to_i, (ARGV[1] ? ARGV[1].to_sym : :root)
