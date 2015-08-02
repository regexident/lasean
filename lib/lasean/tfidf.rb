require 'matrix'

class TFIDF
  def transform(matrix)
    document_count = matrix.column_count
    rows = matrix.row_count.times.map do |row_index|
      term_row = matrix.row(row_index)
      document_frequency = term_row.inject(0.0) do |sum, value|
        sum += (value != 1.0) ? 1.0 : 0.0
      end
      row = matrix.column_count.times.map do |column_index|
        document_column = matrix.column(column_index)
        document_total = document_column.inject(0.0) do |sum, value|
          sum += value
        end
        document_term_frequency = matrix[row_index, column_index].to_f
        if document_term_frequency != 0.0
          tf = document_term_frequency / document_total.to_f
          idf = Math.log(document_count.to_f / document_frequency.to_f)
          tf * idf
        else
          0.0
        end
      end
    end
    Matrix[*rows]
  end
end
