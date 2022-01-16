// import { PrismaClient } from '@prisma/client'

// const prisma = new PrismaClient()

export async function getLeagues(){

    const data = await prisma.league.findMany({})

    return data

}


export async function getEvents(){

  const data = await prisma.event.findMany({include: {
    eventors: {
      select: {
        title: true,
      }, // Return all fields
  },}})

  return data

}

