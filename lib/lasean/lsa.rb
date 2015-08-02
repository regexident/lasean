require 'sivade'
require_relative 'tfidf'

class LSA
  attr_accessor :u, :s, :v

  def initialize(matrix)
    @matrix = matrix
    @u, @s, @v = matrix.svd_decompose(2)
    @v = Matrix[* matrix.column_count.times.map { |index| @v.row(index) }]
  end

  def classify_row(values)
    return enum_for(:classify_row, values) unless block_given?
    classify_vector(values, @v, @u, @s).each do |index, similarity|
      yield index, @matrix.row(index), similarity
    end
  end

  def classify_column(values)
    return enum_for(:classify_column, values) unless block_given?
    classify_vector(values, @u, @v, @s).each do |index, similarity|
      yield index, @matrix.column(index), similarity
    end
  end

  private

  def classify_vector(vector, mult, comp, sigma)
    return enum_for(:classify_vector, vector, mult, comp, sigma) unless block_given?
    position = Matrix.row_vector(vector) * mult * sigma.inverse
    vector1 = position.row(0)
    comp.row_count.times do |index|
      vector2 = comp.row(index)
      product = vector1.magnitude * vector2.magnitude
      inner_product = vector1.inner_product(vector2)
      product = vector1.magnitude * vector2.magnitude
      cosine_similarity = (product != 0.0) ? inner_product / product : 0.0
      yield index, cosine_similarity
    end
  end
end
