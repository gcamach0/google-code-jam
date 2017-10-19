class OminousOmino
  def initialize()
  end
  def testCase(line)
    values = line.split(" ").map(&:to_i)
    xomino = values[0]
    rows = values[1]
    columns = values[2]
    area = rows * columns
    winner = "GABRIEL"

    if xomino>6 || xomino > area || area%xomino >0 || self.perfectPieceExists(xomino,rows,columns)
        winner = "RICHARD"
    end

    winner
  end


  def perfectPieceExists(xomino, rows,columns)
    length=xomino
    height=1
    exists = false

    case xomino
      when 4
        if rows == 2 || columns == 2
          exists = true
        end
      when 5
        if rows == 2 || columns == 2 || rows == 3 && columns ==5 || rows == 5 && columns ==3
          exists = true
        end
      when 6
        if rows == 2 || columns == 2 || rows == 3 || columns == 3
          exists = true
        end
    end

    while length >= height
        if length<=rows && height<=columns || height<=rows && length<=columns
            length-=1
            height+=1
        else
          exists = true
          break
        end
    end
    exists
  end
end


