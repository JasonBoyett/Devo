import { Scripture } from "../types/Scripture"

export async function getVerse(scripture: Scripture): Promise<any> {
  try {
    const url = `https://jsonbible.com/search/verses.php?json=${scriptureToJson(scripture)}`
    const result = await fetch(url, {
      mode: "no-cors",
      credentials: "omit",
    })
    console.log(result.text())
    return result.text()
  } catch (error) {
    alert(error)
    return "Error: Could not fetch verse."
  }
}

function scriptureToJson(scripture: Scripture) {
  return JSON.stringify({
    book: scripture.book,
    chapter: scripture.chapter.toString(),
    verse: (() => {
      if (scripture.end) return `${scripture.start}-${scripture.end}`
      else return scripture.start.toString()
    })(),
    version: scripture.version,
  })
}
