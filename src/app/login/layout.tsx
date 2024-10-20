import { getServerSession } from 'next-auth';
import { FC, ReactNode } from 'react';
import { options } from "@/app/api/auth/[...nextauth]/route";

interface Props {
  authenticated: ReactNode;
  unauthenticated: ReactNode;
}

const HomeLayout: FC<Props> = async ({ authenticated, unauthenticated }) => {
  // optionsはapiで使用したものを使用する
  const session = await getServerSession(options);

  return <>{session ? authenticated : unauthenticated}</>;
};

export default HomeLayout;