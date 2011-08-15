# adapted from jasmine-node example spec

describe 'jasmine-node', ->
  it 'should pass', -> expect(1+2).toEqual(3)

  it 'shows asynchronous test', ->
    setTimeout ->
      expect('second').toEqual('second')
      asyncSpecDone()
    , 1
    expect('first').toEqual('first')
    asyncSpecWait()

