# frozen_string_literal: true

SHAPES = %i[rock scissors paper].freeze
MAPPING = { A: :rock, B: :paper, C: :scissors,
            X: :rock, Y: :paper, Z: :scissors }.freeze
POINTS = { rock: 1, paper: 2, scissors: 3 }.freeze

def won?(me, other)
  SHAPES[(SHAPES.find_index(me) + 1) % 3] == other
end

def score(me, other)
  score = POINTS[me]
  score += 6 if won?(me, other)
  score += 3 if me == other
  score
end

def pick(other, result)
  case result
  when :X then SHAPES[(SHAPES.find_index(other) + 1) % 3]
  when :Y then other
  when :Z then SHAPES[(SHAPES.find_index(other) - 1) % 3]
  end
end

def score2(other, result)
  me = pick(other, result)
  score(me, other)
end

rounds = File.read('input/day02.txt').lines
             .map(&:chomp).compact
             .map { |l| l.split(' ') }

puts rounds.map { |other, me| [MAPPING[other.to_sym], MAPPING[me.to_sym]] }
           .map { |other, me| score(me, other) }
           .sum

puts rounds.map { |other, result| [MAPPING[other.to_sym], result.to_sym] }
           .map { |other, result| score2(other, result) }
           .sum
